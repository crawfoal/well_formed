require_relative "stubbed_persistance"

class Station
  include ActiveModel::Model
  include StubbedPersistance

  attr_accessor :name, :address, :coordinate_pair
end
