class CreateVotes < ActiveRecord::Migration[5.0]
  def self.up
    create_table :votes do |t|
      t.integer :entity_id, null: false
      t.string :entity_type, null: false
      t.integer :user_id, null:false
      t.timestamps null: false
    end
    add_index :votes, :entity_id
    add_index :votes, :entity_type
    add_index :votes, :user_id
  end
  def self.down
    drop_table :votes
    remove_index :votes, :user_id
    remove_index :votes, :entity_id
    remove_index :votes, :entity_type
  end
end
