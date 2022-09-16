require 'rails_helper'

RSpec.describe 'foods/index', type: :view do
  before(:each) do
    @user = User.create(name: 'Zamir', password: '123456', email: 'exmple@gmail.com')
    assign(:foods, [
             Food.create!(
               name: 'Name',
               measurement_unit: 'Measurement Unit',
               price: 2.5,
               quantity: 3,
               user: @user
             ),
             Food.create!(
               name: 'Name',
               measurement_unit: 'Measurement Unit',
               price: 2.5,
               quantity: 3,
               user: @user
             )
           ])
  end

  it 'renders a list of foods' do
    render
  end
end
