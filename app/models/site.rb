class Site < ActiveRecord::Base
    mount_uploader :image, ImageUploader
    mount_uploader :logo, ImageUploader
    mount_uploader :footer_logo, ImageUploader
end
