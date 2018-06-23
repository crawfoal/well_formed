require_relative "stubbed_persistance"

class Address
  include ActiveModel::Model
  include StubbedPersistance

  attr_accessor :street, :city, :state, :zip
end
