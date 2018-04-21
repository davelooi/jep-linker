require 'rails_helper'

# User visits log in route
# User enters email + password
# clicks log in
# Sees their homepage
RSpec.feature "signing in" do
  let(:user){ FactoryBot.create(:user) }
  scenario "signs in" do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"
    expect(page).to have_content("Signed in successfully.")
  end

  scenario "user leaves email blank" do
    visit new_user_session_path
    fill_in 'Email', with: ''
    fill_in 'Password', with: user.password
    click_button "Log in"
    expect(page).to have_content("Invalid Email or password.")
  end

  scenario "user leaves password blank" do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: ''
    click_button "Log in"
    expect(page).to have_content("Invalid Email or password.")
  end

  scenario "user leaves both email and password blank" do
    visit new_user_session_path
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    click_button "Log in"
    expect(page).to have_content("Invalid Email or password.")
  end

  scenario "user tries to sign in without having signed up before" do
    visit new_user_session_path
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    click_button "Log in"
    expect(page).to have_content("Invalid Email or password.")
  end
end
