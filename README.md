[![CircleCI](https://circleci.com/gh/pitonneux/website/tree/master.svg?style=shield)](https://circleci.com/gh/pitonneux/website/tree/master)
[![Coverage Status](https://coveralls.io/repos/github/pitonneux/website/badge.svg?branch=master)](https://coveralls.io/github/pitonneux/website?branch=master)
[![Code Climate](https://codeclimate.com/github/pitonneux/website/badges/gpa.svg)](https://codeclimate.com/github/pitonneux/website)

# Read Me

This is the website for Les Pitonneux. It's still in development and everyone is welcome to contribute! The public-facing part shows our upcoming events and behind the scenes it allows for organizers to manage and plan events. Everybody is welcome and encouraged to contribute. This can be a great way to get your feet wet with contributing to a live open-source project! Feel free to join our [Slack Channel]() if you have any questions, need some help getting started, or just want to meet some friendly people.

# Contributing

We love contributions! The first thing to check are the Issues with the priority label. You can also optionally use [Zenhub](https://www.zenhub.com/) to see the development pipeline and issue boards.

# Development Setup

Fork the repository and clone it to your machine then change directory into `pitonneux`.
```bash
git clone address_of_your_fork && cd pitonneux
```

## Database

This project uses PostgresQL, a free and open-source database. Google the instructions for your operating system, or if you're on a mac run
```bash
brew install postgresql
```

## Ruby version

The project currently uses ruby `2.3.1`. You can install many versions of Ruby on your machine with a ruby environment manager. Two common ones are [rbenv](https://github.com/rbenv/rbenv) and [rvm](https://rvm.io/).

## Libraries

External depenencies are managed with [bundler](http://bundler.io/). Install it by running
```ruby
gem install bundler
```

## Rails

The project is built with Rails, a stable and mature web framework. If you're unfamiliar with it there are tons of great tutorials out there, like [Michael Hartl's Rails tutorial](https://www.railstutorial.org/book), or you can check out the great documentation on [RailsGuides](http://guides.rubyonrails.org/).

### Setup the project

Once you have all dependencies installed, setup the project with
```bash
bin/setup
```

This script runs the following commands to set up your local development environment:
- install `bundler` for managing gem dependencies
- install all required gems
- create and setup your databse
- cleanup logs and temporary files

### Setting environment variables

Cloudinary is used for image hosting

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
