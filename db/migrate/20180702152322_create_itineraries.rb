class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.integer :trip_id
      t.integer :city_id

      t.timestamps
    end
  end
end
