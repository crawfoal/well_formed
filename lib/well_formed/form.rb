require "active_model"

require "well_formed/dsl"
require "well_formed/persistance"
require "well_formed/validations"
require "well_formed/synchronization"
require "well_formed/null_model"

module WellFormed
  class Form
    include ActiveModel::Model

    extend WellFormed::DSL
    include WellFormed::Persistance
    include WellFormed::Validations
    include WellFormed::Synchronization

    def initialize(*args)
      if args.first.respond_to? :id
        args.each do |model|
          model_name = model.model_name.to_s.underscore
          send("#{model_name}=", model)
          self.class.children[model_name.to_sym].each do |child|
            send("#{child}=", model.send(child))
          end
        end
        pull_attributes
      else
        super
      end
    end
  end
end
