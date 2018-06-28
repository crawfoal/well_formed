require_relative "stubbed_persistance"
require_relative "stubbed_validations"

class Station
  include ActiveModel::Model
  include StubbedPersistance
  include StubbedValidation

  attr_accessor :name, :address, :coordinate_pair
end
