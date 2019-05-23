class Ingredient < ApplicationRecord
  INGREDIENTS = Ingredient.all

  has_many :doses
  validates :name, presence: true
  validates :name, uniqueness: true
end
