RSpec.describe WellFormed::Validations do
  describe "#valid?" do
    it "returns false if a validation fails" do
      form = StationForm.new

      expect(form).to_not be_valid
    end

    it "returns true if all validations pass" do
      form = StationForm.new(build(:station, address: build(:address)))

      expect(form).to be_valid
    end

    it "returns false if a model is not valid" do
      invalid_address = build(:address, :invalid)
      form = StationForm.new(build(:station, address: invalid_address))

      expect(form).to_not be_valid
    end
  end

  describe "#errors" do
    it "includes errors from the models" do
      invalid_coordinate_pair = build(:coordinate_pair, :invalid)
      station = build(:station, coordinate_pair: invalid_coordinate_pair)
      form = StationForm.new(station)

      form.valid?
      expect(form.errors).to_not be_empty
    end
  end
end
