require "active_model"

require "well_formed/dsl"
require "well_formed/persistance"
require "well_formed/validations"
require "well_formed/null_model"

module WellFormed
  class Form
    include ActiveModel::Model

    include WellFormed::DSL
    include WellFormed::Persistance
    include WellFormed::Validations

    def initialize(*args)
      set_all_models_to_null_model
      if args.first.respond_to? :id
        args.each do |model|
          model_name = model.model_name.to_s.underscore
          send("#{model_name}=", model)
          children_for(model_name.to_sym).each do |child_name|
            child = model.send(child_name)
            send("#{child_name}=", child) if child.present?
          end
        end
      else
        super
      end
    end

    private

    def set_all_models_to_null_model
      model_names.each do |model|
        send "#{model}=", NullModel.new(attribute_names[model])
      end
    end
  end
end
