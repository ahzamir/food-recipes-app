require 'rails_helper'

RSpec.describe RecipesController, type: :routing do

  before(:each) do
    @user = User.create!(name: 'John Doe', email: 'example@gmail.com', password: 'password')
    @recipe = Recipe.create!(name: 'Recipe 1', preparation_time: '00:00:00', cooking_time: '00:00:00', description: 'Description 1', public: true, user_id: @user.id)
  end

  describe 'routing' do
    it 'routes to #index' do
      expect(get: "#{user_recipes_path(@user)}").to route_to('recipes#index', user_id: @user.id.to_s)
    end

    it 'routes to #new' do
      expect(get: "#{new_user_recipe_path(@user)}").to route_to('recipes#new', user_id: @user.id.to_s)
    end

    it 'routes to #show' do
      expect(get: "#{user_recipe_path(@user, @recipe)}").to route_to('recipes#show', user_id: @user.id.to_s, id: @recipe.id.to_s)
    end

    it 'routes to #edit' do
      expect(get: "#{edit_user_recipe_path(@user, @recipe)}").to route_to('recipes#edit', user_id: @user.id.to_s, id: @recipe.id.to_s)
    end

    it 'routes to #create' do
      expect(post: "#{user_recipes_path(@user)}").to route_to('recipes#create', user_id: @user.id.to_s)
    end

    it 'routes to #destroy' do
      expect(delete: "#{user_recipe_path(@user, @recipe)}").to route_to('recipes#destroy', user_id: @user.id.to_s, id: @recipe.id.to_s)
    end
  end
end
