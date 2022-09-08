require 'rails_helper'

RSpec.describe 'Group', type: :system do
  before(:all) do
    Group.destroy_all
    User.destroy_all
    @user = User.create(name: 'Jhon', email: 'test@gmail.com', password: 'password')
    @group = Group.create(user: @user, name: 'food', icon: 'icon-test')
  end
  it 'Needs group total' do
    visit('http://localhost:3000')
    click_button 'LOG IN'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'log in'
    sleep(0.5)
    visit('http://localhost:3000/group')
    expect(page).to have_content('Total')
  end
  it 'Needs group total amount' do
    visit('http://localhost:3000')
    click_button 'LOG IN'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'log in'
    sleep(0.5)
    visit('http://localhost:3000/group')
    expect(page).to have_content('$0.00')
  end
  it 'Needs Sing out btn' do
    visit('http://localhost:3000')
    click_button 'LOG IN'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'log in'
    sleep(0.5)
    visit('http://localhost:3000/group')
    expect(page).to have_content('Sing out')
  end
  it 'Needs Title' do
    visit('http://localhost:3000')
    click_button 'LOG IN'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'log in'
    sleep(0.5)
    visit('http://localhost:3000/group')
    expect(page).to have_content('Categories')
  end
  it 'Adds a Category' do
    visit('http://localhost:3000')
    click_button 'LOG IN'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'log in'
    sleep(0.5)
    visit('http://localhost:3000/group')
    click_button('New group')
    fill_in 'group_name', with: 'Dog Food'
    click_button('create')
    sleep(0.5)
    expect(Group.last.name).to be == 'Dog Food'
    Group.last.destroy
  end
  it 'redirect to transactions' do
    visit('http://localhost:3000')
    click_button 'LOG IN'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'log in'
    sleep(0.5)
    visit('http://localhost:3000/group')
    click_link(@group.name)
    expect(current_path).to be == group_entities_path(@group.id)
    expect(page).to have_content('Entities')
  end
  it 'redirect add category' do
    visit('http://localhost:3000')
    click_button 'LOG IN'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'log in'
    sleep(0.5)
    visit('http://localhost:3000/group')
    click_button('New group')
    sleep(0.5)
    expect(current_path).to be == new_group_path
  end
end
