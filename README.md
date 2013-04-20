# Requirements
* Ruby
* Rails
* MongoDB  
http://docs.mongodb.org/manual/installation/
* ImageMagic

# Set up
    rake db:drop
    rake db:init

# Run
    rails s

# Daily development
- Clean up unused branches which don't exist the remote

    git remote prune origin

- Start automatic Rspec tesing with Guard and Spork

    guard
