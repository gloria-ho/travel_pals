class AddDateFieldsToItinerary < ActiveRecord::Migration[5.2]
  def change
    add_column :itineraries, :start_date, :date
    add_column :itineraries, :end_date, :date
  end
end
