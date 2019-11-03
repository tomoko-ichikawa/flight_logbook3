class Flight < ApplicationRecord
	belongs_to :user
	mount_uploader :photo1, ImageUploader
	mount_uploader :photo2, ImageUploader
	mount_uploader :photo3, ImageUploader
end
