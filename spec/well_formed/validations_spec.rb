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
end
