class AddSlugToSubCategories < ActiveRecord::Migration
  def change
    add_column :sub_categories, :slug, :string
  end
end
