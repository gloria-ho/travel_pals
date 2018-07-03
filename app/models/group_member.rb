class GroupMember < ApplicationRecord
  validates :group_id, :user_id, presence: true
  belongs_to :group
end
