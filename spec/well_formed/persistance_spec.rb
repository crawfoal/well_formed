RSpec.describe WellFormed::Persistance do
  describe "#save" do
    it "saves all models" do
      address = build(:address)
      station = build(:station, address: address)
      form = StationForm.new(station)
      form.name = "Updated Station"

      expect(address).to receive(:save!).and_call_original
      expect(station).to receive(:save!).and_call_original

      form.save
    end
  end
end
