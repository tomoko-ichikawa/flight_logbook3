class Flight < ApplicationRecord
	belongs_to :user
	has_many :favorites
	mount_uploader :photo1, ImageUploader
	mount_uploader :photo2, ImageUploader
	mount_uploader :photo3, ImageUploader

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
