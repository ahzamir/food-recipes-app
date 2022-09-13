class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe, through: :recipe_foods
end
