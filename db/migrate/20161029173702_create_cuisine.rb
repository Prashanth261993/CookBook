class CreateCuisine < ActiveRecord::Migration[5.0]
  def self.up
    create_table :cuisines do |t|
      t.string :name, null: false
      t.timestamp
    end
    add_index :cuisines, :name
  end
  def self.down
    drop_table :cuisines
    remove_index :cuisines, :name
  end
end
