class WelcomeUserJob < ActiveJob::Base
  queue_as :default

  def perform(twitt_handle)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRETx']
    end
    client.follow(twitt_handle)
    client.direct_message('Bienvenue sur Selfie On The Fly !')
    client.direct_message('Veux-tu configuer ton compte avec moi ?')
  end
end
