require_relative "../lib/tweetland"

every 2.minutes do
  rake "tweets:all"
end
