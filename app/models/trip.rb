class Trip < ApplicationRecord
  validates :nickname, :cost, :deadline, :start_date, :end_date, presence: true
 
  belongs_to :group, optional: true
  belongs_to :creator, class_name: 'User'
  has_one :itinerary
  has_many :goals
end
