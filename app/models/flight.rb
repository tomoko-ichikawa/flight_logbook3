class Flight < ApplicationRecord
	belongs_to :user
	mount_uploader :photo1, ImageUploader
end
