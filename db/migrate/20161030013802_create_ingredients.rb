class CreateIngredients < ActiveRecord::Migration[5.0]
  def self.up
    create_table :ingredients do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :ingredients, :name
  end
  def self.down
    drop_table :ingredients
    remove_index :ingredients, :name
  end
end
