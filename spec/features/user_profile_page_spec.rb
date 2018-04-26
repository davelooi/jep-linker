require 'rails_helper'

RSpec.feature 'when a user is signed in' do
  scenario 'shows them their already created links' do
    user = FactoryBot.create(:user, api_key: 'abc123')
    user_link = user.links.create!(long_url: "http://ryanbigg.com/2016/04/hiring-juniors", short_url: "abc123")
    sign_in(user)

    visit '/'
    expect(page).to have_content(user_link.long_url)
  end
end
