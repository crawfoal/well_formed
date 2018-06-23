module WellFormed
  module Synchronization
    def pull_attributes
      self.class.attribute_names.each do |model_name, attribute_names|
        model = send(model_name) || NullModel.new(attribute_names)
        attribute_names.each do |attr_name|
          send("#{attr_name}=", model.send(attr_name))
        end
      end
    end
  end
end
