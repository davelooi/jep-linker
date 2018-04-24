require 'uri/http'

class CreateLink
  def self.short_link_from_existing_link(long_url, user_chosen_short_url, current_user)
    long_url = Addressable::URI.heuristic_parse(long_url).to_s
    existing_link = Link.where(long_url: long_url).first

    return existing_link if existing_link
    create_new_link(long_url, user_chosen_short_url, current_user)
  end

  private

  def self.create_new_link(long_url, short_url, current_user)
    # if current_user
    #   link = Link.new(long_url: long_url, user: current_user)
    # else
      link = Link.new(long_url: long_url)
    # end

    current_user.links << link if current_user
    current_user.save

    return link if !link.valid?

    if short_url.empty?
      link.create_uniq_short_url
    else
      link.user_create_uniq_short_url(short_url)
    end
    link
  end
end
