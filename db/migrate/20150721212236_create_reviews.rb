class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :category, index: true, foreign_key: true
      t.belongs_to :sub_category, index: true, foreign_key: true
      t.string :title
      t.string :slug
      t.float :score
      t.float :price
      t.float :features
      t.float :support
      t.text :short_description
      t.text :first_paragraph
      t.text :second_paragraph
      t.text :third_paragraph
      t.text :top_features
      t.float :lowest_price
      t.text :image
      t.text :url
      t.integer :total_viewed
      t.string :is_published
      t.string :is_featured

      t.timestamps null: false
    end
  end
end
