module WellFormed
  module DSL
    def model(name, attributes: [], parent: nil)
      model_names << name
      class_eval { attr_accessor name }
      attributes.each do |attribute|
        class_eval { delegate attribute, "#{attribute}=", to: name }
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
