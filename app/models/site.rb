class Site < ActiveRecord::Base
    mount_uploader :image, ImageUploader
end
