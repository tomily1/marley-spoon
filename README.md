# Marley Spoon
[![Build Status](https://travis-ci.com/tomily1/marley-spoon.svg?token=pEvX4L5vELYgZNrdwxyT&branch=master)](https://travis-ci.com/tomily1/marley-spoon)

Rails application that consumes recipes data from Contentful API and displays it.

### Requirements
1. Ruby version 2.6.0
2. Rails 5.2
3. Bundler version 1.17.2


### Technology used
* Language
  1. Ruby
* Framework used
  1. Ruby on Rails
* Development and testing
  1. RSpec Rails
  2. Rubocop

### Setting up
1. clone this respository `git@github.com:tomily1/marley-spoon.git`.
2. Open the cloned directory with `cd marley-spoon`.
3. Run `bundle install` to install dependencies
4. run `cp -v .env.sample .env`
5. copy over your environment credentials to the .env file. i.e set `SPACE_ID`, `ENVIRONMENT` and `ACCESS_TOKEN`.
5. run the app with `bundle exec rails server`
6. the app will be available on `localhost:3000`


### Live Demonstration

This app is available and hosted on Heroku and it is available here https://marley-spoons.herokuapp.com.

### Future Improvements
This project covers the basic implementation and is written well enough to easily allow improvement and upgrades and also well tested with a good coverage. However, there are some improvements to be made. These changes include but not limited to:

1. Allowing pagination in the frontend to allow fetching of recipes that are more than a page limit (for now, there are 28 records and maximum allowed is 100)

2. Currently we memoize api data from contentful which is enough for now, a more robust way is to use a caching system (e.g. redis) and serialize data from cache on fetch. This will reduce the cost of making api calls, also tackle rate limiting issues incase the traffic increases in the future.
