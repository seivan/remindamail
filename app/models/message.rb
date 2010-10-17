class Message < ActiveRecord::Base
  #Associations 
  belongs_to :user
    
  #scopes
  scope :next, order("arrived_at ASC").limit(1)
  scope :sent, where(:sent => true)
  scope :queued, where(:sent => false)

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
