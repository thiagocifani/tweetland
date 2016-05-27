require "spec_helper"
require "sequel"
require "twitter"

require_relative "../../../lib/tweetland/boot"
require_relative "../../../lib/tweetland/tweets_fetcher"
require_relative "../../../lib/tweetland/twitter_client"
require_relative "../../../lib/tweetland/tweet"

module Tweetland
  describe TweetsFetcher do

    subject { TweetsFetcher.new("nasa") }
    it "#serialize" do
      expect(subject.save.size).to eq 50
    end
  end
end
