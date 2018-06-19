require 'active_support'
require 'active_support/core_ext/string/inflections'

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.acronym 'DSL'
end
