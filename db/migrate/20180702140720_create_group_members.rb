class CreateGroupMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :group_members do |t|
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
