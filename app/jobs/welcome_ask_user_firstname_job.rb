class WelcomeAskUserFirstnameJob < ActiveJob::Base
  queue_as :default

  def perform(user)

    $twitter.create_direct_message(user.tw_handle, 'Quel est ton prénom ?')

  end
end
