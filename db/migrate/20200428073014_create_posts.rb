class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :content
      t.string :image
      t.integer :likes_count
      # t.references :category, foreign_key: true
      t.references :category, null: false
      t.timestamps
    end
  end
end
