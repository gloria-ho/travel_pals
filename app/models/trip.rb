class Trip < ApplicationRecord
  validates :nickname, :total_cost, :funds_deadline, :trip_start_date, :trip_end_date, presence: true
 
  belongs_to :group, optional: true
  belongs_to :creator, class_name: 'User'
  has_one :itinerary
  has_many :goals
end
