RSpec.describe WellFormed::Synchronization do
  describe "#pull_attributes" do
    it "sets the form's attributes based on each model's current state in "\
       "memory" do
      station = build :station, name: "Station Name"
      form = StationForm.new(station)

      form.pull_attributes

      expect(form.name).to eq "Station Name"
    end
  end
end
