module StubbedValidation
  def valid?
    @validity = true if @validity.nil?
    @validity
  end

  def valid=(value)
    @validity = value
  end
end
