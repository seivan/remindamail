class Message < ActiveRecord::Base
  belongs_to :user
  # scope :next_mail, lambda { |user_id| 
  #     where(:user_id => user_id, :status => false).
  #     order("arrived_at ASC").
  #     limit(1).first
  #     }
  def self.per_page
    10
  end
  

  
  def self.next_mail(user_id)
    Message.
    where(:user_id => user_id, :status => false).
    order("arrived_at DESC").
    limit(1).
    first
  end
  
  def self.queued_mails(user_id)
    Message.
      #where(:user_id => user_id, :status => true)
      find(:all).length
  end
  
end
