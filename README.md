wpcs
[![Build Status](https://travis-ci.org/TakenokoChocoHolic/wpcs.png?branch=master)](https://travis-ci.org/TakenokoChocoHolic/wpcs)
[![Dependency Status](https://gemnasium.com/TakenokoChocoHolic/wpcs.png)](https://gemnasium.com/TakenokoChocoHolic/wpcs)
[![Code Climate](https://codeclimate.com/github/TakenokoChocoHolic/wpcs.png)](https://codeclimate.com/github/TakenokoChocoHolic/wpcs)
[![Coverage Status](https://coveralls.io/repos/TakenokoChocoHolic/wpcs/badge.png?branch=master)](https://coveralls.io/r/TakenokoChocoHolic/wpcs)
=====

# Requirements
* Ruby
* Rails
* MongoDB  
http://docs.mongodb.org/manual/installation/
* ImageMagic

# Install dependencies
- for general

        bundle install

- for only Linux (after gneral installation)

        sudo apt-get install libnotify-bin

# Initialize database
    rake db:drop
    rake db:setup

# Documents
- Class diagram  
https://cacoo.com/diagrams/zJncLkksT8WHeY4b

# Daily development
- Run a rails sever on your machine

        rails s

- Clean up unused branches which don't exist the remote

        git remote prune origin

- Start automatic Rspec tesing with Guard and Spork

        guard
        
- Clean up precompiled javascript files

        rake assets:clean
