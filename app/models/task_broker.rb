class TaskBroker

  def on_user_changed(user)
    unless user.is_welcomed then
      welcome_user user
    end
    if user.is_welcomed and user.firstname == nil then
      welcome_ask_user_firstname user
    end
    if user.firstname != nil and user.name == nil then
      welcome_ask_user_name user
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

  def welcome_ask_user_name(user)
    puts "WelcomeAskUserNameJob Queued"
    WelcomeAskUserNameJob.perform_later user
  end

  def on_dm(event)

    sender = User.find_by_tw_id(event.sender.id.to_s)
    if sender != nil
      if sender.is_welcomed and sender.firstname == nil
        if event.text.downcase.include? "skip"
          sender.firstname = ""
          sender.save
        else
          sender.firstname = event.text.capitalize
          sender.save
        end
      end
      if sender.firstname != nil and sender.name == nil
        if event.text.downcase.include? "skip"
          sender.name = ""
          sender.save
        else
          sender.name = event.text.capitalize
          sender.save
        end
      end
    end
  end

end