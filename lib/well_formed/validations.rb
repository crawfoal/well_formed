module WellFormed
  module Validations
    def valid?
      if !models.all?(&:valid?)
        merge_model_errors
        false
      else
        super
      end
    end

    private

    def merge_model_errors
      models.each do |model|
        model.errors.each do |attribute, message|
          errors.add(attribute, message)
        end
      end
    end
  end
end
