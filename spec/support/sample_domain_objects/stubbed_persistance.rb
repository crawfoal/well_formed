module StubbedPersistance
  def id
    1
  end

  def save!
    !!valid?
  end
end
