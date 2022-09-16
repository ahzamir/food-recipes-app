class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods, dependent: :destroy
  validates :name, :price, :quantity, :measurement_unit, presence: true
end
