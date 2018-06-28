require "active_support"
require "active_support/concern"

module WellFormed
  module DSL
    extend ActiveSupport::Concern

    def model_names
      self.class.model_names
    end

    def attribute_names
      self.class.attribute_names
    end

    def children_for(*args)
      self.class.children_for(*args)
    end

    class_methods do
      def model(model_name, attributes: [], parent: nil)
        model_names << model_name
        write_methods(model_name, attributes)
        attribute_names[model_name] = attributes
        children_for(parent) << model_name if parent.present?
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

      private

      def write_methods(model_name, attributes)
        class_eval do
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
end
