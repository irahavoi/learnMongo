require_relative 'config'
require_relative 'TweerArchiver'

TAGS.each do |tag|
  archive = TweetArchiver.new(tag)
  archive.update
end