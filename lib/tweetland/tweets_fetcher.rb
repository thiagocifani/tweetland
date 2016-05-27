# This class is a SRP one, only fetches
# tweets from api to save it on database.
module Tweetland
  class TweetsFetcher
    attr_reader :topic, :client

    def initialize(topic, twitter_api = TwitterClient)
      @topic  = topic
      @client = twitter_api.new
    end

    def save
      tweets.each do |tweet|
        next if saved?(tweet)
        Tweet.new(attributes(tweet)).save
      end
    end

    private

    def tweets
      client.last_tweets_for(topic).take(50)
    end

    def saved?(tweet)
      Tweet.where(tweet_id: tweet.id.to_s).any?
    end

    def attributes(content)
      {}.tap do |hash|
        hash[:created_at]     = content.created_at
        hash[:favorite_count] = content.favorite_count
        hash[:handle]         = content.user.screen_name
        hash[:user_photo_url] = content.user.profile_image_url.to_s
        hash[:retweet_count]  = content.retweet_count
        hash[:topic]          = topic
        hash[:tweet_content]  = content.text
        hash[:tweet_id]       = content.id
      end
    end
  end
end
