class Itinerary < ApplicationRecord
  validates :start_date, :end_date, presence: true
  validates_uniqueness_of :city_id, scope: :trip_id
  belongs_to :trip
  belongs_to :city
end
