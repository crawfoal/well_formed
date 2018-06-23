module WellFormed
  module Persistance
    def save
      if valid?
        persist
      else
        false
      end
    end

    # override this method if needed
    def persist
      if defined? ActiveRecord::Base
        ActiveRecord::Base.transaction { models.each { |model| model.save } }
      else
        models.each { |model| model.save }
      end
    end

    private

    def models
      self.class.model_names.map { |name| send(name) }
    end
  end
end
