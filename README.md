[![CircleCI](https://circleci.com/gh/pitonneux/website/tree/master.svg?style=shield)](https://circleci.com/gh/pitonneux/website/tree/master)
[![codecov](https://codecov.io/gh/pitonneux/website/branch/master/graph/badge.svg)](https://codecov.io/gh/pitonneux/website)
[![Code Climate](https://codeclimate.com/github/pitonneux/website/badges/gpa.svg)](https://codeclimate.com/github/pitonneux/website)
[![Dependency Status](https://gemnasium.com/badges/github.com/pitonneux/website.svg)](https://gemnasium.com/github.com/pitonneux/website)

# Read Me

This is the website for Les Pitonneux. It's still in development and everyone is welcome to contribute! The public-facing part shows our upcoming events and behind the scenes it allows for organizers to manage and plan events. Everybody is welcome and encouraged to contribute. This can be a great way to get your feet wet with contributing to a live open-source project! Feel free to [come out to our meetups](http://www.meetup.com/pitonneux/) if you have any questions, need some help getting started, or just want to meet some friendly people.

# Contributing

We love contributions! The first thing to check are the Issues with the [priority](https://github.com/pitonneux/website/labels/priority) label. You can also optionally use [Zenhub](https://www.zenhub.com/) to see the development pipeline and issue boards and pick any issue from the "Next Up" column. When you start working on an issue, let everyone else know somehow (move the issue to the "In Progress" column, add the "in progress" label, or even just leave a comment saying "Got this one!"), so that we don't end up with two people developing the same feature at the same time.

Anybody is welcome to submit a pull request. See below on how to set up your machine for development and how our development process works. Once you have the app up and running, run the tests (`rspec`) and make sure they pass. Then write some specs and add your changes. Make the tests pass again. Then push to your fork and [submit a pull request](https://github.com/pitonneux/website/compare/). Then, you'll be waiting on us. We try to at least comment on all pull requests within a couple of days. We might suggest some changes or improvements or alternatives. Some things you can do to increase the chances of your pull request being accepted are:
- Make sure everything is tested
- Follow the style and standards of the project
- Write a [good commit message](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)
- Discuss major features or changes before deciding on a final approach

## Style Guides
This codebase is monitored by [hound CI](https://houndci.com/), which automatically comments on style violations. We follow community style guides for [ruby](https://github.com/bbatsov/ruby-style-guide), [Rails](https://github.com/bbatsov/rails-style-guide), [Sass](http://sass-lang.com/styleguide), [coffeescript](https://github.com/polarmobile/coffeescript-style-guide), and [slim](http://slim-lang.com/). If your pull request has some comments by the hound, please fix those to speed up the review process.

# Development Setup

Fork the repository and clone it to your machine then change directory into `website`. Rename it if you want to.
```bash
git clone git@github.com:***your-github-username***/website.git && cd website
```

## Database

This project uses Postgresql, a free and open-source database. Google the instructions on how to install it for your operating system, or if you're on a mac run
```bash
brew install postgresql
```

Jobs are queued with Sidekiq, which uses redis to keep track of jobs. You'll need to install redis. On a mac you can run
```bash
brew install redis
```

## Ruby version

The project currently uses ruby `2.3.1`. You can install many versions of Ruby on your machine with a ruby environment manager. Two common ones are [rbenv](https://github.com/rbenv/rbenv) and [rvm](https://rvm.io/).

### Libraries

External depenencies are managed with [bundler](http://bundler.io/). It will be installed when you run the `bin/setup` script, or if you're setting up your environment by yourself you can install it manually
```ruby
gem install bundler
```

### Rails

The project is built with Rails, a stable and mature web framework. If you're unfamiliar with it there are tons of great tutorials out there, like [Michael Hartl's Rails tutorial](https://www.railstutorial.org/book), or you can check out the great documentation on [RailsGuides](http://guides.rubyonrails.org/).

## Setup the project

### Setting environment variables

We use cloudinary for image hosting. You can sign up for a [free cloudinary account](https://cloudinary.com/users/register/free) to get API keys for  your local development and testing environments. You will need these keys to seed the database.

We use send grid for sending emails. Our contact list is also synced with send grid. You can sign up for a [free sendgrid account](https://app.sendgrid.com/signup) to get your username, password, and make an API key. Messages from the homepage contact form are delivered to the website admin, so you need to set the `ADMIN_EMAIL` environment variable as well for the tests to pass. Set it to your own if you want the form to send to your email address in development.

Your environment variables should be the following:

```bash
ADMIN_EMAIL=any_email_address@email.com

CLOUDINARY_API_KEY=
CLOUDINARY_API_SECRET=

SENDGRID_USERNAME=
SENDGRID_PASSWORD=
SENDGRID_API_KEY=
```

### Launch your database server

**Ubuntu users:** before proceeding, remove the line for postgresql. 

You need to start your postgres server, redis server, and Sidekiq worker. We use `foreman` with the `Procfile.dev` to automate this. Make sure you have `foreman` installed (`gem install foreman`) and run

```bash
foreman start -f Procfile.dev
```

You need to specify the right procfile with the `-f` flag because there is a different Procfile for production. You can also launch these things separately if you want to.


### Setting up the project

Once you have the above dependencies installed and your database server is running, setup the project with

```bash
bin/setup
```

This script runs the following commands to set up your local development environment:
- install `bundler` for managing gem dependencies
- install all required gems
- create and setup your databse
- cleanup logs and temporary files

You can also run those steps manually.

### Starting your server

Start your local server. You can run a local server with
```
rails server
```
Unless you configure a different local host the app will be available at [http://localhost:3000](http://localhost:3000).

## Developing a feature and submitting a pull request

In your pull request and in your branch name, specify the number of the issue you're working on. This way github will [automatically close the issue(s)](https://github.com/blog/1506-closing-issues-via-pull-requests) once the pull request has been merged.

## Testing

The app is tested with RSpec. You can run all the tests with
```bash
rspec
```

Run a single test file by passing only the test file, or a single test example by passing the test file with the line of the test you want to run:
```bash
rspec spec/path/to/your/spec.rb
rspec spec/path/to/your/spec.rb:8  # 8 is the line number of the test you want to run.
```

I recommend using [zeus](https://github.com/burke/zeus), an external gem, to pre-load the app so your tests run instantly.

# Bugs
If you find any bugs please [open an issue](https://github.com/pitonneux/website/issues) in project's repo.

# License
This app is released under the [MIT License](https://github.com/pitonneux/website/blob/master/LICENSE).
