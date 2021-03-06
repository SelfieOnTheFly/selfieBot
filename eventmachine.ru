# Dédicace à Benj qui va se dire WTF quand il va tomber là-dessus. -Daminou

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application

EM.schedule do

  $stream = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
    config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
    config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
    config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
  end

  $stream.user do |event|
    case event
      when Twitter::Tweet
        puts "Tweet : #{event.text}"
      when Twitter::DirectMessage
        ::TaskBroker.new.on_dm event
      when Twitter::Streaming::StallWarning
        warn 'Falling behind!'
    end
  end

end

