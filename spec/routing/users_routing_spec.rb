require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  before(:each) do
    @user = User.create!(name: 'Zamir', email: 'example@gmail.com', password: 'password')
  end

  describe 'routing' do
    it 'routes to #index' do
      expect(get: users_path.to_s).to route_to('users#index')
    end

    it 'routes to #new' do
      expect(get: new_user_path.to_s).to route_to('users#new')
    end

    it 'routes to #show' do
      expect(get: user_path(@user).to_s).to route_to('users#show', id: @user.id.to_s)
    end

    it 'routes to #edit' do
      expect(get: edit_user_path(@user).to_s).to route_to('users#edit', id: @user.id.to_s)
    end

    it 'routes to #destroy' do
      expect(delete: user_path(@user).to_s).to route_to('users#destroy', id: @user.id.to_s)
    end
  end
end
