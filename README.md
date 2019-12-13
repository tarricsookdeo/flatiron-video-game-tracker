# Flatiron Video Game Tracker

This web app allows users to track their video game collection. It allows users to create, read, update, and delete video games
from their collection. Users are only allowed to edit games from their own inventory.

## Installation

Required Ruby Gems:

gem 'sinatra'
gem 'activerecord', '~> 4.2', '>= 4.2.6', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'sqlite3', '~> 1.3.6'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem 'tux'

All of the gems are included in the Gemfile. All you need to do is run bundle install.

Note that the app is tested using the shotgun server provided by the shotgun gem.
