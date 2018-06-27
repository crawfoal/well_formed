module WellFormed
  module DSL
    def model(name, attributes: [], parent: nil)
      model_names << name
      class_eval { attr_accessor name }
      attributes.each do |attribute|
        class_eval { delegate attribute, "#{attribute}=", to: name }
      end
      attribute_names[name] = attributes
      # TODO: refactor the way you access a list of children so that the
      #       initialization automatically happens on the first call for each
      #       parent (using a method, e.g. `children_for`)
      children[name] = []
      children[parent] << name if parent.present?
    end

    def model_names
      @model_names ||= []
    end

    def attribute_names
      @attribute_names ||= {}
    end

    def children
      @children ||= {}
    end
  end
end
