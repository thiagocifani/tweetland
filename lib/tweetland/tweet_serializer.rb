module Tweetland
  # Serializes values to and from the API.
  module TweetSerializer
    IDENTITY = ->(v) { v }

    TO_API = {
      topic: ["topic", IDENTITY]
    }

    BUILD_TWEET = ->(values) { Tweet.new(values) }

    def self.serialize(tweet)
      return if tweet.nil?

      map(TO_API, tweet.values, &:to_s)
    end

    def self.map(column_mapping, tweet, &strategy)
      tweet.map do |k, v|
        col, value_conversion = column_mapping[k] ||
                                [strategy.call(k), IDENTITY]
        [col, value_conversion.call(v)]
      end.to_h
    end
  end
end
