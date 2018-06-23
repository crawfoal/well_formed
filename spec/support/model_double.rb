class ModelDouble < RSpec::Mocks::Double
  def model_name
    @name
  end

  def id
    1
  end
end
