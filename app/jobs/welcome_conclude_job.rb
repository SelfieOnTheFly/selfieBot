class WelcomeConcludeJob < ActiveJob::Base
  queue_as :default

  def perform(user)

    unless user.mail.include? "@"
      $twitter.create_direct_message(user.tw_handle, "Je ne peux pas créer de compte sans e-mail, #{user.firstname}")
      $twitter.create_direct_message(user.tw_handle, 'Visite notre site web http://swlille.fr')
    else
      $twitter.create_direct_message(user.tw_handle, "Bienvenue sur SelfieOnTheFly #{user.firstname} !")
    end


  end

end
