class ReadDM < ActiveJob::Base
  queue_as :default

  def perform(direct_message, sender_id)

    #FetchUser and Broke
    sender = User.find_by_tw_id(sender_id.to_s)
    if sender != nil
      ::TaskBroker.new.broke_dm(direct_message, sender)
    end

  end

end
