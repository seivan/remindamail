class UserMailer < ActionMailer::Base
  
  def future_email(user)
    mail(:to => params[:id])
  end
  
end
