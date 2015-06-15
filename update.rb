require_relative 'config'
require_relative 'TweerArchiver'
require 'openssl'

puts OpenSSL::OPENSSL_VERSION
puts "SSL_CERT_FILE: %s" % OpenSSL::X509::DEFAULT_CERT_FILE
puts "SSL_CERT_DIR: %s" % OpenSSL::X509::DEFAULT_CERT_DIR

#Dirty Hack! Remove after figuring out the problem with ssl:
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

TAGS.each do |tag|
  archive = TweetArchiver.new(tag)
  archive.update
end