require 'rubygems'

require 'active_record'
require 'mysql2'



ActiveRecord::Base.establish_connection(
  :adapter => "mysql2",
  :host => "localhost",
  :database => "remindamail_production",
  :username => "remindamail",
  :password => "seivanheidari"
)



class User < ActiveRecord::Base
  has_many :authorizations
  has_many :messages
end

class Authorization < ActiveRecord::Base
  belongs_to :user
end

class Message < ActiveRecord::Base
  belongs_to :user
  scope :queued, where(:sent => false)
  scope :sent, where(:sent => true)
end

date = 2.hours.from_now.to_date

puts Message.queued.where("arrived_at <= ?",date).count


require 'mail'

options = { :address              => 'smtp.sendgrid.net',
            :port                 => 25,
            :user_name            => 'remindamail@gmail.com',
            :password             => 'asdasd',
            :domain               => "remindamail.com",
            :authentication       => 'plain'}
                                                                                                                                                                                    
                                                                                                    
# options2 = { :address              => 'smtp.gmail.com',                                             
#             :port                 => 25,                                                            
#             :user_name            => 'remindamail@gmail.com',                                       
#             :password             => 'asdasdasdasd',                                                
#             :domain               => "remindamail.com",                                             
#             :authentication       => 'plain',                                                       
#             :enable_starttls_auto => true  }                                                        
                                                                                                    
Mail.defaults do                                                                                    
  delivery_method :smtp, options                                                                    
end                                                                                                 
                                                                                                    
                                                                                                    
 Message.queued.where("arrived_at <= ?",date).each do |message|                                      
   mail = Mail.new                                                                                  
   mail.from = message.from                                                                         
   mail.to    = message.to                                                                          
   mail.subject = message.subject                                                                   
   str = """This is a message from #{message.user.name} 
   with #{message.user.authorizations.first.profile_url} \n sent to you by Remind-a-Mail 
   http://remindamail.it/ \n"""                     
   str << "\n"
   mail.body = str
   puts mail.body
   #message.update_attribute(:sent, true) if mail.deliver
 end
 
#puts mail.to_s #=> "From: mikel@test.lindsaar.net\r\nTo: you@.



