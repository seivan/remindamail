module MessagesHelper
  
  def next_message(messages)
    begin
      debugger
      message = messages.queued.next.first
      date = message.arrived_at
    rescue NoMethodError => e
      date = nil
      message = new_message_path
    end
    date = date ? " in #{time_ago_in_words(date)}" : "when you write one!"
    link_to(date, message, :remote => true, :id => "next-mail")
  end

  def link_to_and_pluralize_mail(messages)
    count = messages.count
    word = pluralize(count, "mail")
    link_name = nil
    path = messages_path(:sent => false)
    if count == 0
      link_name = " are no mails"
      path = new_message_path
    elsif  count > 1
      link_name =  " are " + word      
    else
      link_name =  " is " + word
    end
    link_to(link_name, path, :remote => true, :id => "mail-amount")
  end
end
