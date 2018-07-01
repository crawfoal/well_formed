module WellFormed
  class InvalidForm < StandardError
    def initialize(msg = <<~TEXT)
      The form couldn't be saved because it (or one of it's models) was invalid.
    TEXT
      super
    end
  end
end
