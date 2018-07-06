class Goal < ApplicationRecord
  validates :user_id, :trip_id, :goal, :current, :deadline, presence: true
  validates_uniqueness_of :trip_id, scope: :user_id
  belongs_to :trip
end
