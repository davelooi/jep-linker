require 'rails_helper'
RSpec.describe "Link validator" do
  it "returns an error for an invalid link" do
    link = Link.new(long_url: "www.bit.ly")

    link.valid?

    expect(
      link.errors[:long_url]
    ).to include('is already a shortened URL')
  end
end
