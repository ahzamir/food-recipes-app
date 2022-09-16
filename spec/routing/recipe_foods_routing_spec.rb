require 'rails_helper'

RSpec.describe RecipeFoodsController, type: :routing do
  before(:each) do
    @user = User.create!(name: 'Zamir', email: 'example@gmail.com', password: 'password')
    @recipe = Recipe.create!(name: 'Recipe 1', preparation_time: '00:00:00', cooking_time: '00:00:00',
                             description: 'Description 1', public: true, user_id: @user.id)
    @food = Food.create!(name: 'Food 1', measurement_unit: 'kg', price: 1.0, quantity: 1, user_id: @user.id)
    @recipe_food = RecipeFood.create!(quantity: 1, recipe_id: @recipe.id, food_id: @food.id)
  end

  describe 'routing' do
    it 'routes to #new' do
      expect(get: new_user_recipe_recipe_food_path(@user,
                                                   @recipe).to_s).to route_to('recipe_foods#new',
                                                                              user_id: @user.id.to_s, recipe_id: @recipe.id.to_s)
    end

    it 'routes to #create' do
      expect(post: user_recipe_recipe_foods_path(@user,
                                                 @recipe).to_s).to route_to('recipe_foods#create',
                                                                            user_id: @user.id.to_s, recipe_id: @recipe.id.to_s)
    end

    it 'routes to #destroy' do
      expect(delete: user_recipe_recipe_food_path(@user, @recipe,
                                                  @recipe_food).to_s).to route_to('recipe_foods#destroy',
                                                                                  user_id: @user.id.to_s, recipe_id: @recipe.id.to_s, id: @recipe_food.id.to_s)
    end
  end
end
