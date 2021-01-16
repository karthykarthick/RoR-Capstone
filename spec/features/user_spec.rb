require 'rails_helper'

RSpec.describe 'User Features', type: :feature do
  scenario 'Fail to update an photo' do
    user1 = User.create(id: 1, username: 'hello', full_name: 'Helloo')
    visit new_session_path
    fill_in 'user_username', with: user1.username
    click_button 'Login'

    visit edit_user_path(id: 1)

    find('.upload', exact: true)
    expect(page).to have_content('')
  end

  scenario 'Fail to update an image' do
    user1 = User.create(id: 1, username: 'hello', full_name: 'Helloo')
    visit new_session_path
    fill_in 'user_username', with: user1.username
    click_button 'Login'

    visit edit_user_path(id: 1)

    find('.upload1', exact: true)
    expect(page).to have_content('')
  end
end