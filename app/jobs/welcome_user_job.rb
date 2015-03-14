class WelcomeUserJob < ActiveJob::Base
  queue_as :default

  def perform(user)

    puts $twitter

    $twitter.follow(user.tw_handle)
    $twitter.create_direct_message(user.tw_handle, 'Bienvenue sur Selfie On The Fly !')
    $twitter.create_direct_message(user.tw_handle, 'Nous allons configurer ton compte ensemble')
    $twitter.create_direct_message(user.tw_handle, 'A tout moment tu peux repondre "skip" pour passer à la question suivante')

    user.is_welcomed = true

    user.save
  end

end
