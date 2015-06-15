require 'rubygems'
require 'mongo'
require 'twitter'

require_relative 'config'

class TweetArchiver
  def initialize(tag)

    client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => DATABASE_NAME)
    @tweets = client[COLLECTION_NAME]
    #@tweets.create_index([['id', 1]], :unique => true)
    #@tweets.create_index([['tags', 1], ['id', -1]])
    @tag = tag
    @tweets_found = 0
  end

  def update
    puts "Starting Twitter search for '#{@tag}'..."
    save_tweets_for(@tag)
    print "#{@tweets_found} tweets saved.\n\n"


  end

  def save_tweets_for(term)
    @tweets_found += 1
    #@tweets.insert_one({"tags" => [term]})

    tweetClient = Twitter::REST::Client.new do |config|
      config.consumer_key    = "kAhnK4qfDaxegS3V5qZwqGe68"
      config.consumer_secret = "kgKt6Z28KEBKMjbhyfM09kviUq8eRMEmsmBI5epOu0to5Db0ZZ"
    end

    puts tweetClient.search("#ruby -rt", :lang => "ru").first
    @tweets.insert_one({"tags" => [term], "text" => tweetClient.search("#ruby -rt", :lang => "ru").first.text})

  end
end

db.products.insert({slug: "wheel-barrow-9092", sku: "9092", name: "Extra Large Wheel Barrow", details : {weight: 47, weight_units: "lbs", mmodel_num:3433352, manufacturer: "Acme", color: "Green", category_ids[new ObjectId("557dfc60ba608d1d12ed779e")], main_cat_id: new ObjectId("557dfc60ba608d1d12ed779e"), tags: ["tools", "gardening", "soil"]})