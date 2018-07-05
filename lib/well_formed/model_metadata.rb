module WellFormed
  class ModelMetadata
    attr_reader :model_names, :attribute_names, :children

    def initialize(form_class)
      @form_class = form_class
      @model_names ||= []
      @attribute_names ||= {}
      @children ||= {}
    end

    def add(model_name, attributes: [], parent: nil)
      model_names << model_name
      write_methods(model_name, attributes)
      attribute_names[model_name] = attributes
      children_for(parent) << model_name if parent.present?
    end

    def children_for(model)
      children[model] ||= []
    end

    private

    def write_methods(model_name, attributes)
      @form_class.class_eval do
        attr_accessor model_name
        attributes.each do |attribute_name|
          delegate attribute_name, to: model_name
          define_method "#{attribute_name}=" do |value|
            unless send(model_name).present?
              send("#{model_name}=", model_name.to_s.classify.constantize.new)
            end
            send(model_name).send("#{attribute_name}=", value)
          end
        end
      end
    end
  end
end
