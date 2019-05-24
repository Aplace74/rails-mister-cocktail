class Cocktail < ApplicationRecord
  has_many :doses, dependent: :delete_all
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :delete_all

  mount_uploader :photo, PhotoUploader
  validates :name, presence: true
  validates :name, uniqueness: true
end
