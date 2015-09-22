class AddFacebookToSite < ActiveRecord::Migration
  def change
    add_column :sites, :facebook_url, :string
    add_column :sites, :twitter_url, :string
    add_column :sites, :gplus_url, :string
    add_column :sites, :youtube_url, :string
    add_column :sites, :logo, :string
    add_column :sites, :footer_logo, :string
  end
end
