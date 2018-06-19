module WellFormed
  module DSL
    def model(name, attributes: [])
      attributes.each { |attribute| class_eval { attr_accessor attribute } }
    end
  end
end
