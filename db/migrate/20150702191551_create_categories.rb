class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :total_viewed
      t.string :image

      t.timestamps null: false
    end
  end
end
