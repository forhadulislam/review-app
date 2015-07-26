class CreateSubCategories < ActiveRecord::Migration
  def change
    drop_table :sub_categories
    create_table :sub_categories do |t|
      t.belongs_to :category, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.integer :total_viewed
      t.text :image

      t.timestamps null: false
    end
  end
end
