class StationForm < WellFormed::Form
  model :station, attributes: [:name]
  model :address, attributes: [:street, :city, :state, :zip], parent: :station
  model :coordinate_pair, parent: :station

  validate do
    unless address.present? ^ coordinate_pair.present?
      errors.add(:base, <<~TEXT)
        One and only one of address and coordinate_pair can be present.
      TEXT
    end
  end
end
