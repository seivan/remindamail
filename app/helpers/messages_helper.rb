module MessagesHelper
  
  def next_mail
    date = Message.next_mail(current_user.id).try(:arrived_at)
    date ? time_ago_in_words(date) : "when you write one :)"
  end
  
end
