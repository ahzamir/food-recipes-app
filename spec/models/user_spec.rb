require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(name: 'zamir', email: 'example@gmail.com', password: 123_456, password_confirmation: 123_456)
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new(name: nil, email: 'example@gmail.com', password: 123_456, password_confirmation: 123_456)
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user = User.new(name: 'Zamir', email: nil, password: 123_456, password_confirmation: 123_456)
      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user = User.new(name: 'Zamir', email: 'example@gmail.com', password: nil, password_confirmation: 123_456)
      expect(user).to_not be_valid
    end
  end
end