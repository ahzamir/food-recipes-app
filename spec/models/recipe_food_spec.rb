require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before :each do
    @user = User.create(name: 'John Doe', email: 'johndoe@gmail.com', password: 123_456, password_confirmation: 123_456)
    @recipe = Recipe.create(name: 'Apples', preparation_time: '1 hour', cooking_time: '1:30',
                            description: 'Lorem ipsum', public: false, user_id: @user.id)
    @food = Food.create(name: 'Apples', measurement_unit: 'pieces', price: 18, quantity: 24, user_id: @user.id)
  end
  context 'validations' do
    it 'is not valid without a quantity' do
      recipe = RecipeFood.new(recipe_id: @recipe.id, food_id: @food.id)
      expect(recipe).to_not be_valid
    end

    it 'is not valid without a recipe_id' do
      recipe = RecipeFood.new(quantity: 1, food_id: @food.id)
      expect(recipe).to_not be_valid
    end

    it 'is not valid without a food_id' do
      recipe = RecipeFood.new(quantity: 1, recipe_id: @recipe.id)
      expect(recipe).to_not be_valid
    end

    it 'is not valid with a quantity less than 1' do
      recipe = RecipeFood.new(quantity: 0, recipe_id: @recipe.id, food_id: @food.id)
      expect(recipe).to_not be_valid
    end
  end

  context 'associations' do
    it 'belongs_to recipe' do
      t = RecipeFood.reflect_on_association(:recipe)
      expect(t.macro).to eq :belongs_to
    end

    it 'belongs_to food' do
      t = RecipeFood.reflect_on_association(:food)
      expect(t.macro).to eq :belongs_to
    end
  end
end
