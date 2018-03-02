require 'rails_helper'

RSpec.describe "/api/links" do
  it "returns only the user's link and not anonymous_user's link" do
    user = FactoryBot.create(:user, api_key: 'abc123')
    user_link = user.links.create!(long_url: "http://ryanbigg.com/2016/04/hiring-juniors", short_url: "abc123")
    anonymous_user_link = Link.create!(long_url: "https://hello.com", short_url: "hello")
    get "/api/links", params: {}, headers: { 'Authorization' => 'Bearer abc123' }
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)).to eq([{
      "id" => user_link.id,
      "long_url" => user_link.long_url,
      "short_url" => user_link.short_url,
      "created_at" => user_link.created_at.rfc3339(3),
      "updated_at" => user_link.updated_at.rfc3339(3),
      "user_id" => user.id
    }])
  end

  it "displays a 401 error when no user for authorization key" do
    user = FactoryBot.create(:user, api_key: 'abc123')
    get "/api/links", params: {}, headers: { 'Authorization' => 'Bearer unknown_key' }
    expect(response.status).to eq(401)
    expect(JSON.parse(response.body)).to eq({"error" => "Unauthorized"})
  end
end
