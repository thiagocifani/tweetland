# Boots up HelloOperator, loading the environment in dev and testing
# and connecting to the database.
module Tweetland
  def self.init
    if ENV["RACK_ENV"] != "production"
      require "dotenv"
      Dotenv.load(File.expand_path("../../.env", __dir__))

      ENV["DATABASE_URL"] =
        ENV["TEST_DATABASE_URL"] if ENV["RACK_ENV"] == "test"
    end

    Sequel.connect(ENV["DATABASE_URL"])
  end

  init
end
