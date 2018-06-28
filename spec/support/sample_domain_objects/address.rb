require_relative "stubbed_persistance"
require_relative "stubbed_validations"

class Address
  include ActiveModel::Model
  include StubbedPersistance
  include StubbedValidation

  attr_accessor :street, :city, :state, :zip
end
