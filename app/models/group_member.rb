class GroupMember < ApplicationRecord
  validates :group_id, :user_id, presence: true
  validates_uniqueness_of :group_id, scope: :user_id
  belongs_to :group
end
