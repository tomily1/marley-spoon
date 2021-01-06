MarleySpoonApi.configure do
  Contentful::Client.new(
    space: ENV['SPACE_ID'],
    environment: ENV['ENVIRONMENT'],
    access_token: ENV['ACCESS_TOKEN']
  )
end
