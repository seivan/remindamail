class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    if params["message"] == "invalid_credentials"
      flash[:failure] = "Failed to login due to denial of authentication"
      render :new
    end
    auth_hash = request.env['rack.auth']
    unless @auth = Authorization.find_from_auth_hash(auth_hash)
      @auth = Authorization.create_from_auth_hash(auth_hash, current_user)
    end
    self.current_user = @auth.user
    redirect_to messages_path
  end
  
  def destroy
    current_user = nil
    flash[:success] = "You have been logged out"
    render :new
  end
end
