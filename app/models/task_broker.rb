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

  def on_dm(event)

    sender = User.find_by_tw_id(event.sender.id.to_s)
    if sender.is_welcomed and sender.firstname.empty?
      if event.text.downcase.contains.include? "skip"
        sender.firstname = "NA"
        sender.save
      else
        sender.firstname = event.text.capitalize
        sender.save
      end
    end
  end

end