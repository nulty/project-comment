class CreateTivityActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :tivity_activities do |t|
      t.string :activiable_type
      t.bigint :activiable_id
      t.string :activised_type
      t.bigint :activised_id
      t.bigint :user_id
      t.string :operation

      t.timestamps
    end
  end
end
