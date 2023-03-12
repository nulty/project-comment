require 'tivity/activise'

module Tivity
  TivityUserNotSet = Class.new(StandardError)

  def self.table_name_prefix
    'tivity_'
  end

  def self.tivity_user
    Thread.current[:current_user] || raise(TivityUserNotSet, 'user not set')
  end

  def self.with_user(user)
    Thread.current[:current_user] = user
    yield
    Thread.current[:current_user] = nil
  end
end

ActiveSupport.on_load(:action_controller) do
  if defined?(ActionController::Base)
    ActionController::Base.around_action(lambda { |controller, block|
      Tivity.with_user(controller&.current_user) do
        block.call
      end
    })
  end
end
