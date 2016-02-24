require 'twitter'
require 'emotee'

$stdout.sync = true

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

def delay
  min = (ENV['TWITTER_DELAY'].to_i * 0.50).to_i
  max = (ENV['TWITTER_DELAY'].to_i * 1.05).to_i
  rand(min..max)
end

loop do
  emotee = Emotee.generate
  client.update emotee
  puts "Emotee tweeted: #{emotee}"

  sleep delay
end
