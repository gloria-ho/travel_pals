class Group < ApplicationRecord
  validates :nickname, presence: true
  belongs_to :admin, class_name: 'User'
  belongs_to :creator, class_name: 'User' 
  has_many :group_members
  has_many :trips
end
