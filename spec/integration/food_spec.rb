require 'rails_helper'

RSpec.describe 'Foods', type: :system do
  include Devise::Test::IntegrationHelpers
  before do
    @user = User.create(name: 'Zamir', password: '123456', email: 'ahzamir@gmail.com')
    @food = @user.foods.create(name: 'KabuliPalaw', measurement_unit: 'kg', price: 5, quantity: 2)
    sign_in @user
  end

  it 'should show correct food ' do
    visit foods_path
    expect(page).to have_content(@food.name)
  end

  it 'should redirect to add new food' do
    visit foods_path
    click_on 'Add food'
    expect(page).to have_current_path(new_food_path)
  end
end