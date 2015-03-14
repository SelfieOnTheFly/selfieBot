class TaskBroker

  def on_user_changed(user)
    unless user.is_welcomed then
      welcome_user user
    end
    if user.is_welcomed then
      welcome_ask_user_firstname user
    end
  end

  def welcome_user(user)
    puts "WelcomeUserJob queued"
    WelcomeUserJob.perform_later user
  end

  def welcome_ask_user_firstname(user)
    puts "WelcomeAskUserFirstnameJob Queued"
    WelcomeAskUserFirstnameJob.perform_later user
  end

end