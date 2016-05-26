require "bundler/setup"
require "./lib/tweetland"

Tweetland::API.settings[:authentication_token] = ENV["TWEETLAND_AUTH_TOKEN"]
run Tweetland::API
