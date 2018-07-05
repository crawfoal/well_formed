require_relative "invalid_form"

module WellFormed
  module Persistance
    def save
      if valid?
        persist
      else
        false
      end
    end

    def save!
      if valid?
        persist
      else
        raise InvalidForm
      end
    end

    # override this method if needed
    def persist
      if defined? ActiveRecord::Base
        ActiveRecord::Base.transaction { models.all? { |model| model.save! } }
      else
        models.all? { |model| model.save! }
      end
    end

    private

    def models
      model_metadata.model_names.map { |name| send(name) }
    end
  end
end
