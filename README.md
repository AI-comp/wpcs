# Requirements
* Ruby
* Rails
* MongoDB  
http://docs.mongodb.org/manual/installation/
* ImageMagic

# Set up
    rake db:drop
    rake db:init

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
