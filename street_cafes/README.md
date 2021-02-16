# Street Cafes

## Versioning
- Ruby 2.5.3
- Rails 5.2.4.5

## Dependencies
The following are gems I added in addition to gems created with a new Rails app
- `gem 'pry'`
- `gem 'rspec-rails'`
- `gem 'capybara'`
- `gem 'simplecov'`
- `gem 'shoulda-matchers'`
- `gem 'factory_bot_rails'`
- `gem 'faker'`

## Setup
1. Clone this repo/fork
1. Run `bundle install`
1. Run `rails db:{create,migrate,seed}`
1. If a test database wasn't created automatically, run `RAILS_ENV=test rails db:migrate`
