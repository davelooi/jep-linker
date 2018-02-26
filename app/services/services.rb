module Services
  class Url
    def self.find_or_create(long_url:, short_url:)
      url_string = set_url(url: long_url).to_s
      link = Link.find_by(:long_url => url_string)

      return link if link.present?
      unique_id = Link.all.count + 1
      if short_url.empty?
        short_link = unique_id.to_s + SecureRandom.base64(6) 
        Link.create(long_url: url_string, short_url: short_link)
      else
        custom_url(long_url: long_url, short_url: short_url)
      end
    end

    def self.set_url(url:)
      Addressable::URI.heuristic_parse(url)
    end

    def self.custom_url(long_url:, short_url:)
      url_string = set_url(url: long_url).to_s
      Link.create(long_url: url_string, short_url: short_url) 
    end

  end
end





