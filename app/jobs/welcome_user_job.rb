class WelcomeUserJob < ActiveJob::Base
  queue_as :default

  def perform(user)

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRETx']
    end

    client.follow(user.tw_handle)
    client.create_direct_message(user.tw_handle, 'Bienvenue sur Selfie On The Fly !')
    client.create_direct_message(user.tw_handle, 'Nous allons configurer ton compte ensemble')
    client.create_direct_message(user.tw_handle, 'A tout moment tu peux repondre "skip" pour passer à la question suivante')

    user.is_welcomed = true

    user.save
  end
end
