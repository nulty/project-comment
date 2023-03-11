class AddChangesToTivityActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :tivity_activities, :diff, :json
  end
end
