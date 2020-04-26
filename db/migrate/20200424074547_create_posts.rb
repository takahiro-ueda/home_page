class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :content
      t.string :image
      # t.datetime "created_at", null: false
      # t.datetime "updated_at", null: false
      # t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
