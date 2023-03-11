class CreateTivityActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :tivity_activities do |t|
      t.string :activity_type
      t.string :activity_id
      t.bigint :user_id
      t.string :operation

      t.timestamps
    end
  end
end
