module Tivity
  # Needs a database table to store all the activities
  # Needs a module to include to models that should be activitised
  module Activise
    extend ActiveSupport::Concern

    class_methods do
      # opts
      # create: :create_proc
      def activities(opts = {})
        if opts[:create]
          if opts[:for]
            after_create ->(record) { record.create_activity_for(opts[:for]) }
          else
            after_create :create_activity
          end
        end
        has_many :activities, class_name: 'Tivity::Activity', as: :activiable
      end
    end

    included do
      def create_activity_for(assoc)
        target_model = public_send(assoc)
        target_id = target_model.id
        Activity.create(
          activiable_type: target_model.class.name,
          activiable_id: target_id,
          activised_type: self.class.name,
          activised_id: id,
          user_id: User.last.id,
          operation: :create
        )
      end

      def create_activity
        Activity.create!(activiable_type: self.class.to_s, activiable_id: id, user_id: User.last.id, operation: :create)
      end
      end
    end
  end
end
