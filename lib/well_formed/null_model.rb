module WellFormed
  class NullModel
    attr_reader :attribute_names

    def initialize(attribute_names)
      @attribute_names = attribute_names
    end

    def present?
      false
    end

    def valid?
      true
    end

    def save; end

    def method_missing(name, *args, &block)
      if attribute_names.include? name.to_sym
        nil
      else
        super
      end
    end

    def respond_to_missing?(name, include_private = false)
      attribute_names.include? name.to_sym
    end
  end
end
