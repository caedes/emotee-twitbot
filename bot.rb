require 'twitter'
require 'emotee'

$stdout.sync = true

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

loop do
  emotee = Emotee.generate
  client.update emotee
  puts "Emotee tweeted: #{emotee}"

  sleep ENV['TWITTER_DELAY'].to_i
end
