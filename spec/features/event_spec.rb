require 'rails_helper'

RSpec.feature 'Authentications', type: :feature do
  before :each do
    @user = User.create(name: 'User', email: 'user@mail.com', password: 'asdqwe')
  end

  it 'Should create an event' do
    visit sessions_path
    fill_in 'name', with: 'User'
    click_button 'commit'
    click_on 'Events'
    click_on 'New event'
    fill_in 'title', with: 'New Event'
    fill_in 'description', with: 'Some Description'
    fill_in 'date', with: '20.07.2020'
    click_button 'commit'
    expect(page).to have_content('Event Title')
    expect(page).to have_content('Creator')
  end
end
