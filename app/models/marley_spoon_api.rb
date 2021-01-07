# frozen_string_literal: true

class MarleySpoonApi
  def self.client
    @client ||= contentful_client
  end

  def self.contentful_client
    Contentful::Client.new(
      space: ENV['SPACE_ID'],
      environment: ENV['ENVIRONMENT'],
      access_token: ENV['ACCESS_TOKEN']
    )
  end
end
