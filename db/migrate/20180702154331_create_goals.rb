class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.integer :trip_id
      t.integer :total_goal
      t.integer :current_amount
      t.date :deadline

      t.timestamps
    end
  end
end
