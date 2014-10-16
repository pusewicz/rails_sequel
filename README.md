Sequel for Rails
================

Installation
------------

### Using Rails plugin script:

    script/plugin install git://github.com/pusewicz/rails_sequel.git

### Using Rails 2.1 Gem dependencies

  Install the gem

    gem sources -a http://gems.github.com
    gem install pusewicz-rails_sequel

  Load the gem in `environment.rb`

    Rails::Initializer.run do |config|
      config.gem 'pusewicz-rails_sequel', :lib => 'rails_sequel', :source => 'http://gems.github.com'
    end

Optional
--------

  Remove ActiveRecord framework in `environment.rb` file:

    config.frameworks -= [ :active_record ]

Development
===========

Install gems:

    bundle install

(Tested on Ruby 1.8.7-p375 with Bundler 1.7.3)

Run specs:

    bundle exec spec spec/*_spec.rb

Community
=========

IRC Channel
-----------

  You can find us on #sequel channel ([irc://irc.freenode.net/#sequel](irc://irc.freenode.net/#sequel))
