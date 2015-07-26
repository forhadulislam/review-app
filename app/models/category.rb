class Category < ActiveRecord::Base
    mount_uploader :image, ImageUploader
    has_many :sub_categories
end
