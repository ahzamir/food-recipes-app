require 'rails_helper'

RSpec.describe 'Recipes', type: :system do
  include Devise::Test::IntegrationHelpers
  before do
    @user = User.create(name: 'Zamir', password: '123456', email: 'ahzamir@gmail.com')
    @recipe = @user.recipes.create(name: 'Hummus', preparation_time: '30', cooking_time: '30',
                                   description: 'go shopping first', public: 'true')
    sign_in @user
  end

  it 'should show correct food ' do
    visit user_recipes_path(@user)
    expect(page).to have_content(@recipe.name)
  end

  it 'should show correct food description ' do
    visit user_recipes_path(@user)
    expect(page).to have_content(@recipe.description)
  end
end
