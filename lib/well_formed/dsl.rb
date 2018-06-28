module WellFormed
  module DSL
    def model(name, attributes: [], parent: nil)
      model_names << name
      class_eval { attr_accessor name }
      attributes.each do |attribute|
        class_eval do
          delegate attribute, to: name
          define_method "#{attribute}=" do |value|
            unless send(name).present?
              send("#{name}=", name.to_s.classify.constantize.new)
            end
            send(name).send("#{attribute}=", value)
          end
        end
      end
      attribute_names[name] = attributes
      children_for(parent) << name if parent.present?
    end

    def model_names
      @model_names ||= []
    end

    def attribute_names
      @attribute_names ||= {}
    end

    def children_for(model)
      children[model] ||= []
    end

    def children
      @children ||= {}
    end
  end
end
