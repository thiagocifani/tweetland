module Tweetland
  # Tweetland keeps records of some buzzwords on twitter for later
  # search. This api lets the user fetch data from db for a specific
  # topic. ["healthcare", "nasa", "opensource"]
  class API < Cuba
    REQ_OK = 200
    REQ_UNAUTHORIZED = 401

    def on_with_auth(path, *args)
      on(path, *args) do |*captures|
        if req.env["HTTP_AUTHORIZATION"] == API.settings[:authentication_token]
          yield(*captures)
        else
          res.status = REQ_UNAUTHORIZED
          res.write("You must send a valid token in the 'Authorization' header")
        end
      end
    end

    def json_tweet(key)
      payload = JSON.parse(req.body.read)
      value = TweetSerializer.deserialize(payload[key])

      -> { captures << value unless value.to_s.empty? }
    ensure
      req.body.rewind
    end

    def write_json(value)
      res.headers["Content-Type"] = "application/json; charset=utf-8"
      res.status = REQ_OK

      res.write(yield(value).to_json)
    end
  end

  API.define do
    TWEET_JSON = ->(p) { TweetSerializer.serialize(p) }
    ARRAY_OF_TWEET_JSON = ->(ps) { ps.map(&TWEET_JSON) }

    on get do
      on_with_auth "tweets/:topic" do |topic|
        on "latest" do
          write_json(Tweet.latest_by(topic), &ARRAY_OF_TWEET_JSON)
        end
      end

      on_with_auth "all" do
        write_json(Tweet.all, &ARRAY_OF_TWEET_JSON)
      end
    end
  end
end
