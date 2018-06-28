module WellFormed
  module Validations
    def valid?
      models.all?(&:valid?) && super
    end
  end
end
