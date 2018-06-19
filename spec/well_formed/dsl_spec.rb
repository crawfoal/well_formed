RSpec.describe WellFormed::DSL do
  class StationForm < WellFormed::Form
    model :station, attributes: [:name]
  end

  describe ".model" do
    it "creates a attr_accessor methods for the model attributes" do
      form = StationForm.new
      form.name = 'Station Name'
      expect(form.name).to eq 'Station Name'
    end
  end
end
