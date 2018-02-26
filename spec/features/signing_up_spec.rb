require 'rails_helper'

RSpec.feature "New user sign up" do
  context "using valid credentials" do
    it "signs up successfully" do
      visit root_path
      click_link "Sign Up"
      expect(page).to have_current_path(new_user_registration_path)
    end
  end
end
