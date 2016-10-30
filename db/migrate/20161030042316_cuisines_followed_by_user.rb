class CuisinesFollowedByUser < ActiveRecord::Migration[5.0]
  def self.up
    create_table :cuisines_followed_by_users do |t|
      t.integer :cuisine_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :cuisines_followed_by_users, :cuisine_id
    add_index :cuisines_followed_by_users, :user_id
  end
  def self.down
    drop_table :cuisines_followed_by_users
    remove_index :cuisines_followed_by_users, :cuisine_id
    remove_index :cuisines_followed_by_users, :user_id
  end
end
