require "active_model"

require "well_formed/dsl"
require "well_formed/persistance"
require "well_formed/validations"
require "well_formed/null_model"

module WellFormed
  class Form
    include ActiveModel::Model

    extend WellFormed::DSL
    include WellFormed::Persistance
    include WellFormed::Validations

    def initialize(*args)
      if args.first.respond_to? :id
        args.each do |model|
          model_name = model.model_name.to_s.underscore
          send("#{model_name}=", model)
          self.class.children[model_name.to_sym].each do |child_name|
            child = model.send(child_name) ||
              NullModel.new(self.class.attribute_names[child_name])
            send("#{child_name}=", child)
          end
        end
      else
        # TODO: We should wait to create the model until a corresponding
        #       attribute has been set - some forms might have optional models.
        #       Additionally, we need to use the Null Child model as a stand in
        #       until we truly initialize the model, otherwise we'll get no
        #       no method errors on nil.
        self.class.model_names.each do |model|
          send "#{model}=", model.to_s.classify.constantize.new
        end
        super
      end
    end
  end
end
