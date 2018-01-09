class CreateLink
  def create_new_link(long_url, short_url: nil)
    link = Link.new(long_url: long_url)
    link.valid?
    return "please enter your link" if link.errors[:long_url].any?
    link.create_uniq_short_url unless short_url
    link.user_create_uniq_short_url(short_url) if short_url
    link.save
    "Your link has been shortened. Your short link is #{link.short_url}"
  end
end
