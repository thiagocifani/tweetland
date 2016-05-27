require "spec_helper"
require "sequel"

require_relative "../../../lib/tweetland/boot"
require_relative "../../../lib/tweetland/tweet_serializer"
require_relative "../../../lib/tweetland/tweet"

module Tweetland
  describe TweetSerializer do

    let!(:tweet_one) { Tweet.create(tweet_content: "lol", handle: "thiagocifani", topic: "nasa",
                                    user_photo_url: "foo", retweet_count: 2, favorite_count: 2,
                                    created_at: Time.now, tweet_id: 2) }
    let!(:tweet_two) { Tweet.create(tweet_content: "lo2s", handle: "thiagocifas", topic: "healthcare",
                                    user_photo_url: "foo", retweet_count: 2, favorite_count: 2,
                                    created_at: Time.now, tweet_id: 2) }


    it "#serialize" do
      expect(TweetSerializer.serialize(tweet_one)["handle"]).to eq "thiagocifani"
    end
  end
end
