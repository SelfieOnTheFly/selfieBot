class TaskBroker

  def on_user_changed(user)
    unless user.is_welcomed then
      welcome_user user
    end
  end

  def welcome_user(user)
    puts "WelcomeUserJob queued"
    WelcomeUserJob.perform_later user
  end

end