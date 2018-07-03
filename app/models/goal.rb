class Goal < ApplicationRecord
  validates :user_id, :group_id, :goal, :current, :deadline
  belongs_to :trip
end
