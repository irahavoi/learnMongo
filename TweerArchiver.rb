require 'mongo'
require 'config'
class TweetArchiver
  def initialize(tag)

    client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => DATABASE_NAME)
    @tweets = client[COLLECTION_NAME]
    @tweets.create_index([['id', 1]], :unique => true)
    @tweets.create_index([['tags', 1], ['id', -1]])
    @tag = tag
    @tweets_found = 0
  end
end