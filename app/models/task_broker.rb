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
    if user.name != nil and user.phone == nil then
      welcome_ask_user_phone user
    end
    if user.phone != nil and user.mail == nil then
      welcome_ask_user_mail user
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

  def welcome_ask_user_phone(user)
    puts "WelcomeAskUserPhoneJob Queued"
    WelcomeAskUserPhoneJob.perform_later user
  end

  def welcome_ask_user_mail(user)
    puts "WelcomeAskUserMailJob Queued"
    WelcomeAskUserMailJob.perform_later user
  end

  def broke_dm(message, sender)

      if sender.is_welcomed and sender.firstname == nil
        if event.text.downcase.include? "skip"
          sender.firstname = "Skipped"
          sender.save
        else
          sender.firstname = event.text.capitalize
          sender.save
        end
      elsif sender.firstname != nil and sender.name == nil
        if event.text.downcase.include? "skip"
          sender.name = "Skipped"
          sender.save
        else
          sender.name = event.text.capitalize
          sender.save
        end
      elsif sender.name != nil and sender.phone == nil
        if event.text.downcase.include? "skip"
          sender.phone = "Skipped"
          sender.save
        else
          sender.phone = event.text
          sender.save
        end
      elsif sender.phone != nil and sender.mail == nil
        if event.text.downcase.include? "skip"
          sender.mail = "Skipped"
          sender.save
        else
          sender.mail = event.text
          sender.save
        end
      end

  end

  def on_dm(event)
    puts "ReadDM queued"
    ReadDM.perform_later event
  end

end