class WelcomeUserJob < ActiveJob::Base
  queue_as :default

  def perform(twitt_handle)
    $twitter.follow(twitt_handle)
    $twitter.direct_message('Bienvenue sur Selfie On The Fly !')
    $twitter.direct_message('Nous allons configurer ton compte ensemble')
    $twitter.direct_message('A tout moment tu peux repondre "skip" pour passer à la question suivante')
  end
end
