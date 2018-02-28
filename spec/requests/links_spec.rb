require 'rails_helper'

RSpec.describe "/api/links" do
  it "GET /api/links" do
    link = Link.create(long_url: "http://ryanbigg.com/2016/04/hiring-juniors", short_url: "abc123")
    get "/api/links"
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)).to eq([{
      "id" => link.id,
      "long_url" => link.long_url,
      "short_url" => link.short_url,
      "created_at" => link.created_at.rfc3339(3),
      "updated_at" => link.updated_at.rfc3339(3)
    }])
  end
end
