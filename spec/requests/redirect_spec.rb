require 'rails_helper'

RSpec.describe "When user navigates to short url", :type => :request do
  it "redirects to the long url" do
    Link.create(long_url: "https://ryanbigg.com/2016/04/hiring-juniors", short_url: "abc123")
    get "/#{Link.first.short_url}"
    expect(response).to redirect_to('https://ryanbigg.com/2016/04/hiring-juniors')
  end
end
