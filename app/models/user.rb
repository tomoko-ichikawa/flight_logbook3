class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true

  has_many :flights
  has_many :comments
  has_many :favorites
  has_many :favorite_flights, through: :favorites, source: :flight

  mount_uploader :icon, IconUploader
end
