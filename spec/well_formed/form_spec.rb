RSpec.describe WellFormed::Form do
  describe "#new" do
    context "when given no args" do
      it "does not raise an error" do
        expect { StationForm.new }.to_not raise_error
      end
    end

    context "when given a hash of attributes" do
      it "saves the attributes" do
        form = StationForm.new(name: "Station Name")

        expect(form.name).to eq "Station Name"
      end
    end

    context "when given a model" do
      it "pulls the model's attributes into the form object" do
        form = StationForm.new(build(:station, name: "Station Name"))

        expect(form.name).to eq "Station Name"
      end

      it "grabs the child models from the parent associations" do
        address = build :address
        station = build :station, address: address

        form = StationForm.new(station)

        expect(form.address).to be_present
      end

      it "pulls the child models' attributes into the form" do
        address = build :address, street: "100 Main Street"
        station = build :station, address: address

        form = StationForm.new(station)

        expect(form.street).to eq "100 Main Street"
      end
    end
  end
end
