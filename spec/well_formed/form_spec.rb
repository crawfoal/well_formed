RSpec.describe WellFormed::Form do
  describe "#new" do
    it "can be called without arguments" do
      expect { StationForm.new }.to_not raise_error
    end

    it "can be called with a hash of attributes" do
      form = StationForm.new(name: "Station Name")

      expect(form.name).to eq "Station Name"
    end

    it "can be called with a model" do
      address = build :address
      station = build :station, address: address

      form = StationForm.new(station)

      expect(form.station).to be_present
      expect(form.address).to be_present
    end
  end
end
