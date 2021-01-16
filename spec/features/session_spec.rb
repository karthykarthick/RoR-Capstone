require 'rails_helper'

RSpec.describe 'Session Features', type: :feature do
  before :each do
  end

  scenario 'require login' do
    visit root_path
    expect(page).to have_content('Login')
  end

  scenario 'require logout' do
    user1 = User.create(username: 'hello', full_name: 'Helloo')
    visit new_session_path
    fill_in 'user_username', with: user1.username
    # click_button 'login-button'
    find('a', exact: true)

    visit new_session_path
    expect(page).to have_content('Login')
  end

  scenario 'try to login with an invalid account' do
    visit new_session_path
    fill_in 'user_username', with: 'Not an user'
    click_button 'Login'
    expect(page).to have_content('Invalid user!')
  end

  scenario 'login with a valid user' do
    user1 = User.create(username: 'hello', full_name: 'Helloo')
    visit new_session_path
    fill_in 'user_username', with: user1.username
    click_button 'Login'
    expect(page).to have_content('Logged in!')
  end

  scenario 'try and fail to create a new user, no username' do
    visit new_user_path
    fill_in 'user_username', with: ''
    fill_in 'user_full_name', with: 'joker'
    find('.login-button', exact: true)
    expect(page).to have_content('')
  end

  scenario 'try and fail to create a new user, no full_name' do
    visit new_user_path
    fill_in 'user_username', with: 'jooker'
    fill_in 'user_full_name', with: ''
    find('.login-button', exact: true)
    expect(page).to have_content('')
  end

  scenario 'try and fail to create a new user, repeated information' do
    user1 = User.create(username: 'hello', full_name: 'Helloo')
    visit new_user_path
    fill_in 'user_username', with: user1.username
    fill_in 'user_full_name', with: user1.full_name
    find('.login-button', exact: true)
    expect(page).to have_content('')
  end
  scenario 'create a new user' do
    visit new_user_path
    fill_in 'user[username]', with: 'hello'
    fill_in 'user[full_name]', with: 'Helloo'
    find('.login-button', exact: true)
    expect(page).to have_content('')
  end
end