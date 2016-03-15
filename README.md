#README

This is my very opinionated default rails app for ideas with users. As though rails doesn't already save me enough time, this skeleton is where I start to save myself time.

##Includes

- Ruby version 2.3.0
- PostgresQL for the database
- Puma for the webserver
- Configuration for deployment to heroku (/config/puma.rb)
- Slim templating language for views
- Font-awesome for icons throughout the app
- Devise for authentication
- Devise views for all things related to user registrations and passwords
  - Development environment configuration for mailers
- RSpec for testing
- Cucumber for integration tests
- A couple other gems just for fun
  - Fuubar for formatting rspec output
  - quiet_assets to unclutter my development log
- A static_pages controller and a static home page
- A flash setup in `application.html.slim`
- A `full_title` helper, a la Michael Hartl rails tutorial
  - If you want to provide a custom title to your pages just specify at the top of your view with `provide(:title, 'My awesome page title')`

##To get up and running

- Clone this repo and call it some project name you like
- Then run `bundle install`
- And `rake db:create`
- Then `rake db:migrate`
- Launch the rails server (`rails s`)
- Launch your postgres server and you should be ready to rock and roll
