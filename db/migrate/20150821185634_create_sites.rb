class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :next_url
      t.string :image
      t.text :meta_tags
      t.text :analytics

      t.timestamps null: false
    end
  end
end
