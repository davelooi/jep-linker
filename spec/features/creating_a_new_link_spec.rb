require 'rails_helper'
require 'capybara/dsl'

RSpec.feature "Creating a new link" do
  before do
    visit "/"
    fill_in "link_long_url", with: "www.ryanbigg.com"
  end

  scenario "successfully creates a new link" do
    fill_in "Long URL", with: "www.ryanbigg.com"
    click_button "Shorten"
    link = Link.first
    find_link("http://www.linker/#{link.short_url}").visible?
  end

  scenario "when a user enters no URL they should see an error message" do
    visit "/"
    click_button "Shorten"
    assert_selector "#notice", text: "URL is invalid" 
  end

  scenario "when user clicks short link, they should be redirected back to long link", js: true do
    click_button "Shorten"
    link = Link.first
    click_link "http://www.linker/#{link.short_url}"
    expect(page).to have_current_path(link.long_url)
  end

  scenario "user clicks Custom url button", js: true do
    page.execute_script("showCustomUrl()")
    input = page.find("#link_short_url")
    expect(input).to be_present
  end

  scenario "user enters custom short url", js: true do
    page.execute_script("showCustomUrl()")
    fill_in "link_short_url", with: "xXx"
    click_button "Shorten"
    link = Link.first
    expect(link.long_url).to eq("http://www.ryanbigg.com")
    expect(link.short_url).to eq("xXx")
  end
end
