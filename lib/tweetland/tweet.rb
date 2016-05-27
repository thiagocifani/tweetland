# This class defines what a tweet is inside our api.
# It is used to save and fetch data from db.
module Tweetland
  class Tweet < Sequel::Model
    def self.latest_by(topic)
      Tweet.where(topic: topic).last(10)
    end

    def self.latest
      Tweet.first(10)
    end
  end
end
