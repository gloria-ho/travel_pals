class Itinerary < ApplicationRecord
  validates :trip_id, :city_id, presence: true
  belongs_to :trips
  has_many :cities, dependent: :destroy
end
