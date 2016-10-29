class CreateArticles < ActiveRecord::Migration[5.0]
  def self.up
    create_table :articles do |t|
      t.text :title, limit: 65535, null: false
      t.integer :author_id, :null => false
      t.integer :cuisine_id
      t.string :time_to_prepare
      t.text :content

      t.timestamp
    end
    add_index :articles, :title
    add_index :articles, :cuisine_id
    add_index :articles, :time_to_prepare
  end
  def self.down
    drop_table :articles

    remove_index :articles, :title
    remove_index :articles, :cuisine_id
    remove_index :articles, :time_to_prepare
  end
end
