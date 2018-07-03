class City < ApplicationRecord
  validates :city, :country, presence: true
  has_many :itineraries, dependent: :destroy
end
