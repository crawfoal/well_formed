require_relative "stubbed_persistance"
require_relative "stubbed_validations"

class CoordinatePair
  include ActiveModel::Model
  include StubbedPersistance
  include StubbedValidation

  attr_accessor :latitude, :longitude
end
