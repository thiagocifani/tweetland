Sequel.migration do
  up do
    create_table :tweets do
      primary_key :id
      String :handle, null: false
      String :tweet_content, null: false
      String :topic, null: false
      String :user_photo_url, null: false
      Fixnum :retweet_count, null: false
      Fixnum :favorite_count, null: false
      Time :created_at, null: false
      Bignum :tweet_id, null: false
    end
  end
end
