class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :nickname
      t.integer :creator_id
      t.integer :admin_id

      t.timestamps
    end
  end
end
