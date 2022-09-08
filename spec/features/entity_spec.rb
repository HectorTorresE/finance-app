require 'rails_helper'

RSpec.describe 'Transactions pages', type: :feature do
  before(:all) do
    Entity.destroy_all
    Group.destroy_all
    User.destroy_all
    @user = User.create(name: 'Jhon', email: 'test@gmail.com', password: 'password')
    @group = Group.create(user: @user, name: 'Food', icon: 'icon-test')
    @entity = Entity.create(user: @user, group: @group, name: 'eggs', amount: 10.00)
  end
  it 'Needs Title' do
    visit('http://localhost:3000')
    click_button 'LOG IN'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'log in'
    sleep(0.5)
    visit('http://localhost:3000/group/1/entities')
    expect(page).to have_content('Entities')
  end
  it 'Needs group title' do
    visit('http://localhost:3000')
    click_button 'LOG IN'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'log in'
    sleep(0.5)
    visit('http://localhost:3000/group/1/entities')
    expect(page).to have_content('Food')
  end
  it 'Needs group total' do
    visit('http://localhost:3000')
    click_button 'LOG IN'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'log in'
    sleep(0.5)
    visit('http://localhost:3000/group/1/entities')
    expect(page).to have_content('$10.00')
  end
  it 'rediderects to new entity' do
    visit('http://localhost:3000')
    click_button 'LOG IN'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'log in'
    sleep(0.5)
    visit('http://localhost:3000/group/1/entities')
    click_button('New entity')
    sleep(0.5)
    expect(current_path).to be == new_group_entity_path(group_id: @group.id)
  end
  it 'Add entity' do
    visit('http://localhost:3000')
    click_button 'LOG IN'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'log in'
    sleep(0.5)
    visit('http://localhost:3000/group/1/entities')
    click_button('New entity')
    fill_in 'entity_name', with: 'Bread'
    fill_in 'entity_amount', with: '3.00'
    click_button('create')
  end
end
