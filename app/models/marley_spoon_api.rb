# frozen_string_literal: true

class MarleySpoonApi
  def self.client
    @client ||= contentful_client
  end

  # def self.with_caching(key, expires_in = 1.day.from_now, &block)
  #   if cache[key].nil? || cache[key][:expiration_time] < Time.now.to_i
  #     cache[key] = { 'value' => yield(block), 'expiration_time' => expires_in }
  #   end

  #   cache[key][:value]
  # end

  # def self.cache
  #   @cache ||= HashWithIndifferentAccess.new
  # end

  def self.contentful_client
    Contentful::Client.new(
      space: ENV['SPACE_ID'],
      environment: ENV['ENVIRONMENT'],
      access_token: ENV['ACCESS_TOKEN']
    )
  end
end
