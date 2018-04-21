require 'rails_helper'

RSpec.feature "When user navigates to short url" do
  scenario "redirects to the long url", js: true do
    Link.create(long_url: "https://ryanbigg.com/2016/04/hiring-juniors", short_url: "abc123")
    visit "/#{Link.first.short_url}"
    expect(page.current_url).to eq("https://ryanbigg.com/2016/04/hiring-juniors")
  end
end
