class Message < ActiveRecord::Base
  #Associations 
  belongs_to :user
    
  #scopes
  scope :next, lambda {where("arrived_at >= (?)", Date.today).order("arrived_at ASC").limit(1)}
  scope :sent, where(:sent => true)
  scope :queued, where(:sent => false)
  scope :arrived_at_asc, lambda {order("arrived_at ASC")}
  scope :created_at_desc, lambda {order("created_at DESC")}
  
    #Validations
            
  validates :subject,
            :presence => true
  
  validates :arrived_at,
            :presence => true

  validates :to,
            :presence => true,
            :email_format => true

  validates :from,
            :presence => true,
            :email_format => true

  
  def self.per_page
    10
  end
  

end
