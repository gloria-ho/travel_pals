class Trip < ApplicationRecord
  validates :nickname, :cost, :deadline, :start_date, :end_date, presence: true
  # validates :group_id
  belongs_to :group
  belongs_to :creator, class_name: 'User'
  has_one :itinerary, dependent: :destroy
  has_many :goals, dependent: :destroy
end
