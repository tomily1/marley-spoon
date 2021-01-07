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
