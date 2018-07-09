class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :nickname
      t.integer :creator_id
      t.integer :total_cost
      t.date :funds_deadline
      t.date :trip_start_date
      t.date :trip_end_date
      t.integer :group_id

      t.timestamps
    end
  end
end
