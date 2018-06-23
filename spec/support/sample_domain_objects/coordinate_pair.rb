require_relative "stubbed_persistance"

class CoordinatePair
  include ActiveModel::Model
  include StubbedPersistance

  attr_accessor :latitude, :longitude
end
