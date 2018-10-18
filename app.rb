require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'townhalls_scrapper.rb'
require 'townhalls_mailer.rb'
require 'townhalls_adder_to_db.rb'
require 'townhalls_follower.rb'