require ::File.expand_path('../config/environment', __FILE__)
run Rails.application

$stream = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

$stream.user do |event|
  case event
    when Twitter::Tweet
      puts "It's a tweet!"
    when Twitter::DirectMessage
      ::TaskBroker.new.on_dm event
    when Twitter::Streaming::StallWarning
      warn "Falling behind!"
  end
end