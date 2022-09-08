require 'rails_helper'

RSpec.describe User, type: :system do
  before(:each) do
    User.destroy_all
    @first_user = User.create(name: 'Jhon', email: 'test@gmail.com', password: '123456')
  end

  it 'Valid with all attributes' do
    expect(@first_user).to be_valid
  end

  it 'needs a name' do
    @first_user.name = nil
    expect(@first_user).to_not be_valid
  end
end
