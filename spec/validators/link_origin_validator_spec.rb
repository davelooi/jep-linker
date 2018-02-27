require 'rails_helper'
RSpec.describe "Link validator" do
  it "returns an error for an invalid link" do
    link = Link.new(long_url: "www.bit.ly")

    link.valid?

    # expect(link).to have(1).errors_on(:long_url)

    expect(
      link.errors[:long_url]
    ).to include?('is already a shortened URL')
  end

  # it "doesn't do anything when a link is valid" do
  #   link = Link.new(long_url: "www.facebook.com")

  #   expect(link).to be_valid
  # end

  # it 'fails when there is no text' do
  #   test_model.html = '<p> </p>'

  #   expect(test_model).to have(1).errors_on(:html)
  # end

  # it 'passes when text is in the HTML' do
  #   test_model.html = '<p>A</p>'

  #   expect(test_model).to be_valid
  # end

  # it 'returns the default error message' do
  #   test_model.html = ' '
  #   test_model.valid?

  #   expect(
  #     test_model.errors[:html]
  #   ).to eq [I18n.t('errors.messages.blank')]
  # end
end
