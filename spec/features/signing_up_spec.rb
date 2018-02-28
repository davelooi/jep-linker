require 'rails_helper'

# User visits sign up route
# User enters email + password
# clicks ?
# Sees "you have signed up
RSpec.feature "signing up" do
  scenario "signs up" do
    visit new_user_registration_path
    fill_in 'Email', with: 'example@example.com'
    fill_in 'Password', with: 'jep_password'
    fill_in 'Password confirmation', with: 'jep_password'
    click_button "Sign up"
    expect(page).to have_content("Hello, example@example.com")
  end

  scenario "user leaves email blank" do
    visit new_user_registration_path
    fill_in :user_email, with: ''
    fill_in :user_password, with: 'jep_password'
    fill_in :user_password_confirmation, with: 'jep_password'
    click_button "Sign up"
    save_page
    expect(page).to have_content("Email can't be blank")
  end

  scenario "user leaves password blank" do
    visit new_user_registration_path
    fill_in :user_email, with: 'hey@example.com'
    fill_in :user_password, with: ''
    fill_in :user_password_confirmation, with: ''
    click_button "Sign up"
    save_page
    expect(page).to have_content("Password can't be blank")
  end

  scenario "user passwords don't match" do
    visit new_user_registration_path
    fill_in :user_email, with: 'hey@example.com'
    fill_in :user_password, with: '1234'
    fill_in :user_password_confirmation, with: '123'
    click_button "Sign up"
    save_page
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario "user passwords are too short" do
    visit new_user_registration_path
    fill_in :user_email, with: 'hey@example.com'
    fill_in :user_password, with: '1234'
    fill_in :user_password_confirmation, with: '1234'
    click_button "Sign up"
    save_page
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end
end
