require 'rails_helper'

RSpec.describe Entity, type: :system do
  before(:each) do
    Entity.destroy_all
    User.destroy_all
    @first_user = User.create(name: 'Jhon', email: 'test@gmail.com', password: '123456')
    @entity = Entity.create(name: 'First entity', amount: 15.7, user: @first_user)
  end

  it 'Valid with all attributes' do
    expect(@entity).to be_valid
  end

  it 'needs a user_id' do
    @entity.user_id = nil
    expect(@entity).to_not be_valid
  end

  it 'needs a name' do
    @entity.name = nil
    expect(@entity).to_not be_valid
  end

  it 'needs an amount' do
    @entity.amount = nil
    expect(@entity).to_not be_valid
  end
end
