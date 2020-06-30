require 'rails_helper'

RSpec.feature 'Authentications', type: :feature do
  before :each do
    @user = User.create(name: 'User', email: 'user@mail.com', password: 'asdqwe')
  end
  it 'Should Create a new user' do
    visit new_user_path
    fill_in 'user[name]', with: 'User'
    fill_in 'user[email]', with: 'email@user.com'
    fill_in 'user[password]', with: 'asdqwe123'

    click_button 'commit'
    expect(page).to have_content('Please Sign In')
    expect(page).to have_content('Name')
  end

  it 'Should Sign in' do
    visit sessions_path
    fill_in 'name', with: 'User'
    click_button 'commit'
    expect(page).to have_content('Created Events')
    expect(page).to have_content('Previous Events')
    expect(page).to have_content('Upcoming Events')
  end

  it 'Should Log out' do
    visit sessions_path
    fill_in 'name', with: 'User'
    click_button 'commit'
    click_on 'Log out'
    expect(page).to have_content('Please Sign In')
    expect(page).to have_content('Name')
  end
end
