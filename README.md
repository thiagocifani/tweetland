## TO RUN

1. Ruby 2.3.0
2. bundle install
3. vagrant up
4. bundle exec rake db:migrate
5. bundle exec whenever -w
6. bundle exec rackup

## Getting tweets

There are 2 classes to handle with tweets. One just get the keys from .env. Another
do all job to collect and save data to postgres from sequel. You should provide a
.env file like:


```
DATABASE_URL=postgres://tweetland:tweetpwd@10.11.12.13:5432/tweetland_devel
TEST_DATABASE_URL=postgres://tweetland:tweetpwd@10.11.12.13:5432/tweetland_test
TWEETLAND_AUTH_TOKEN=foo
YOUR_CONSUMER_KEY=bar
YOUR_CONSUMER_SECRET=barfoo
YOUR_ACCESS_TOKEN=foobar
YOUR_ACCESS_SECRET=yolo

```
