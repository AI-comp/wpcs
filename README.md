wpcs
[![Build Status](https://travis-ci.org/AI-comp/wpcs.png?branch=master)]
(https://travis-ci.org/AI-comp/wpcs)
[![Dependency Status](https://gemnasium.com/AI-comp/wpcs.png)]
(https://gemnasium.com/AI-comp/wpcs)
[![Code Climate](https://codeclimate.com/github/AI-comp/wpcs.png)]
(https://codeclimate.com/github/AI-comp/wpcs)
[![Coverage Status](https://coveralls.io/repos/AI-comp/wpcs/badge.png?branch=master)]
(https://coveralls.io/r/AI-comp/wpcs)

=====

# Requirements
* Ruby (it's recommended to use rbenv to install Ruby)
* Rails
* ImageMagick

        sudo apt-get install imagemagick libmagickcore-dev

# Setup
* for Ubuntu 12.10  
https://gist.github.com/olistik/2627011

# Install dependencies
- for general

        bundle install

- for only Linux (after gneral installation)

        sudo apt-get install libnotify-bin

# Run on development environment

1. Initialize database and assets

        rake db:migrate:reset assets:clean assets:precompile

1. [Optional] Populate database with mock data (for testing purpose)

        rake populate:mock

1. [Optional] Create users with predefined passwords and groups

        rake ghosts[num_groups,num_users(per group),debug(optional)]

  Notice
    * You might have to escape brackets like `rake ghosts\[20,5,debug\]` on shells
    * Database should not contain "Group#{N}" named groups nor "user\_#{N}\_#{M}" named users already
    * Information will be output to ghosts.csv

1. [Optinal] Start automatic Rspec tesing with Guard and Spork

        guard

1. Run a rails sever on your machine in development mode

        rails s

# Run on production environment

1. Initialize database and assets

        rake db:migrate:reset assets:clean assets:precompile RAILS_ENV=production

1. Run a rails sever on your machine in production mode

        rails s -e production

# Documents
- Generate class diagrams for controllers and models

        sudo apt-get install graphviz # if you didn't install graph-viz
        rake diagram:all

# Performance Testing

You might have to use ruby with version >= 1.9.3 and <= 2.0.0.

    rake test:benchmark

# Daily development

- Clean up unused branches which don't exist the remote

        git remote prune origin
        
- Clean up precompiled javascript files

        rake assets:clean


