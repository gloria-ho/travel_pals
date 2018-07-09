class Goal < ApplicationRecord
  validates :user_id, :trip_id, :total_goal, :current_amount, :deadline, presence: true
  validates_uniqueness_of :trip_id, scope: :user_id
  belongs_to :trip
end
