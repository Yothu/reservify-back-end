require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    User.destroy_all
    @user = User.new(name: 'User', email: 'test@gmail.com', password: '123456', role: 'admin', username: 'test')
    @user.save!
  end

  it 'user should be valid' do
    expect(@user).to be_valid
  end
  it 'email should be present' do
    @user.email = nil
    expect(@user).to_not be_valid
  end
  it 'password should be present' do
    @user.password = nil
    expect(@user).to_not be_valid
  end
  it 'username should be present' do
    @user.username = nil
    expect(@user).to_not be_valid
  end
  it 'username should be unique' do
    @user2 = User.new(name: 'User', email: 'test@test.com', password: '123456', role: 'admin', username: 'test')
    @user2.save
    expect(@user2).to_not be_valid
  end

  it 'email should be unique' do
    @user2 = User.new(name: 'User', email: 'test@test.com', password: '123456', role: 'admin', username: 'test')
    @user2.save
    expect(@user2).to_not be_valid
  end
end
