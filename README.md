# Read Me

This is the website for Les Pitonneux. The public-facing part shows our upcoming events and behind the scenes it allows for organizers to manage and plan events. Everybody is welcome and encouraged to contribute. This can be a great way to get your feet wet with contributing to a live open-source project!

## Database

This project uses PostgresQL, a free and open-source database. You'll need to install it, google the instructions for your operating system. If you're on a mac you can run
```bash
brew install postgres
```

## Ruby version

The project currently uses Ruby 2.3.1. You can install many versions of Ruby on your machine with a ruby environment manager. Two common ones are [rbenv](https://github.com/rbenv/rbenv) and [rvm](https://rvm.io/).

## Libraries

External depenencies are managed with [bundler](http://bundler.io/). Install it by running
```ruby
gem install bundler
```

## Setting up your development environment
1. Make a fork of this repo for yourself and clone it to your machine
2. Run `bundle install` to install all the gems
3. Run `bin/setup` to run the setup script to get the project running on your machine. This script sets up everything you need to run the app locally:
  - runs a bundle install to install all gem dependencies
  - prepares your local and test databases
    - loads the schema to create all the tables
    - loads some seed files so you can see the app in a sort-of set up state



- Clone this repo and call it some project name you like
- Then run `bundle install`
- And `rake db:create`
- Then `rake db:migrate`
- Launch the rails server (`rails s`)
- Launch your postgres server and you should be ready to rock and roll
