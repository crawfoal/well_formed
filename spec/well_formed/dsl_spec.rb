RSpec.describe WellFormed::DSL do
  describe ".model" do
    it "adds the model name to the list" do
      expect(StationForm.model_names).to include :station
    end

    it "creates a reader accessor method for the model" do
      expect(StationForm.new).to respond_to :station
    end

    it "creates a attr_accessor methods for the model attributes" do
      form = StationForm.new
      form.name = 'Station Name'
      expect(form.name).to eq 'Station Name'
    end
  end
end
