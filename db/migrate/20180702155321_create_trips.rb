class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :nickname
      t.integer :creator_id
      t.integer :cost
      t.date :deadline
      t.date :start_date
      t.date :end_date
      t.integer :group_id

      t.timestamps
    end
  end
end
