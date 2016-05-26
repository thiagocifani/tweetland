module Tweetland
  # wrapper to make api calls easier,
  # just instanciate this class and call
  # last tweets by topic.
  class TwitterClient
    RECENT = "recent".freeze

    def last_tweets_for(topic)
      client.search(topic, result_type: RECENT)
    end

    def client
      @client ||= Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["YOUR_CONSUMER_KEY"]
        config.consumer_secret     = ENV["YOUR_CONSUMER_SECRET"]
        config.access_token        = ENV["YOUR_ACCESS_TOKEN"]
        config.access_token_secret = ENV["YOUR_ACCESS_SECRET"]
      end
    end
  end
end
