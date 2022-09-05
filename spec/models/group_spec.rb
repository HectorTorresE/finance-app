require 'rails_helper'

RSpec.describe Group, type: :system do
  before(:each) do
    Group.destroy_all
    User.destroy_all
    @first_user = User.create(name: 'Jhon', email: 'test@gmail.com', password: '123456')
    @group = Group.create(name: 'First group', icon: 'icon-test', user: @first_user)
  end

  it 'Valid with all attributes' do
    expect(@group).to be_valid
  end

  it 'needs a user_id' do
    @group.user_id = nil
    expect(@group).to_not be_valid
  end

  it 'needs a name' do
    @group.name = nil
    expect(@group).to_not be_valid
  end
end
