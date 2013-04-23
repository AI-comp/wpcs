# Requirements
* Ruby
* Rails
* MongoDB  
http://docs.mongodb.org/manual/installation/
* ImageMagic

# Install dependencies
- for general

        bundle install

- for only Linux

        sudo apt-get install libnotify-bin

# Initialize database
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
