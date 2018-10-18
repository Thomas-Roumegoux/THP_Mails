require 'bundler'
Bundler.require

$:.unshift File.expand_path("/.../../lib/", __FILE__)
require 'twitter'
require 'dotenv'
require 'pry'
require_relative 'lib/app/townhalls_scrapper.rb'
require_relative 'lib/app/townhalls_mailer.rb'
require_relative 'lib/app/townhalls_follower.rb'

start = Handle.new
start.tweet
