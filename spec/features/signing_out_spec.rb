require 'rails_helper'

# User logs in
# User visits a page
# clicks sign out link
# Sees the homepage and a signout message


RSpec.feature "signing out" do
  scenario "signs out user" do
    user = FactoryBot.create(:user)
    sign_in(user)
    visit "/"
    click_link "Sign Out"
    expect(page).to have_content("Signed out successfully.")
  end
end
