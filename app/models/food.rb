class Food < ApplicationRecord
  belongs_to :user
  # has_many :recipes through: :recipe_food
end
