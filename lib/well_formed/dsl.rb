require "active_support"
require "active_support/concern"

module WellFormed
  module DSL
    extend ActiveSupport::Concern

    delegate :model_metadata, to: :class

    class_methods do
      def model(*args)
        model_metadata.add(*args)
      end

      def model_metadata
        @model_metadata ||= ModelMetadata.new(self)
      end
    end
  end
end
