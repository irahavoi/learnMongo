require 'rubygems'
require 'mongo'

client = Mongo::Client.new('mongodb://127.0.0.1:27017/tutorial')

#client[:users].insert_one({username: 'testuser1'})
#client[:users].insert_many([{username: 'testuser2'}, {username: 'testuser3'}])

client[:users].find().update_many("$set" => {"country" => "Canada"})

client[:users].find().each do |document|
  puts document
end


puts client.database.collections
puts client.database.collection_names