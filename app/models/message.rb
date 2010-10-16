class Message < ActiveRecord::Base
  belongs_to :user
  # scope :next_mail, lambda { |user_id| 
  #     where(:user_id => user_id, :status => false).
  #     order("sending_date ASC").
  #     limit(1).first
  #     }
  def self.per_page
    10
  end
  

  
  def self.next_mail(user_id)
    Message.
    where(:user_id => User.first, :status => false).
    order("sending_date DESC").
    limit(1).
    first
  end
  

  
end
