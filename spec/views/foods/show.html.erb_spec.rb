require 'rails_helper'

RSpec.describe 'foods/show', type: :view do
  before(:each) do
    @user = User.create(name: 'Zamir', password: '123456', email: 'example@gmail.com')
    @food = assign(:food, Food.create!(
                            name: 'Name',
                            measurement_unit: 'Measurement Unit',
                            price: 2.5,
                            quantity: 3,
                            user: @user
                          ))
  end

  it 'renders attributes in <p>' do
    render
  end
end
