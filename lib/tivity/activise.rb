require 'pry'
module Tivity
  # Needs a database table to store all the activities
  # Needs a module to include to models that should be activitised
  module Activise
    extend ActiveSupport::Concern

    class_methods do
      # opts
      # create: :create_proc
      def activities(opts = {})
        before_create :create_activity if opts[:create]
      end
    end

    included do
      def create_activity
        Activity.create(activity_type: self.class.to_s, activity_id: id, user_id: User.last.id, operation: :create)
      end
    end
  end
end
