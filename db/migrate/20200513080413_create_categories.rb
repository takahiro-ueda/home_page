class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name,     index: true, null: false

      t.timestamps
      # add_index :categories, :name, unique:true
    end
  end
end
