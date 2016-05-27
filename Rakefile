require "sequel"
require_relative "lib/tweetland"
require "dotenv"
Dotenv.load

namespace :db do
  Sequel.extension :migration
  DB = Sequel.connect(ENV['DATABASE_URL'])

  desc "Prints current schema version"
  task :version do
    version = if DB.tables.include?(:schema_info)
                DB[:schema_info].first[:version]
              end || 0

    puts "Schema Version: #{version}"
  end

  desc "Perform migration up to latest migration available"
  task :migrate do
    Sequel::Migrator.run(DB, "db/migrate")
    Rake::Task['db:version'].execute
  end

  desc "Perform rollback to specified target or full rollback as default"
  task :rollback, :target do |t, args|
    args.with_defaults(:target => 0)

    Sequel::Migrator.run(DB, "db/migrate", :target => args[:target].to_i)
    Rake::Task['db:version'].execute
  end

  desc "Perform migration reset (full rollback and migration)"
  task :reset do
    Sequel::Migrator.run(DB, "db/migrate", :target => 0)
    Sequel::Migrator.run(DB, "db/migrate")
    Rake::Task['db:version'].execute
  end
end

namespace :tweets do
  desc "fetch tweets"
  task :all  do
    Tweetland::TweetsFetcher.new('nasa').save
    Tweetland::TweetsFetcher.new('healthcare').save
    Tweetland::TweetsFetcher.new('opensource').save
  end
end
