class SessionsController < ApplicationController
  before_filter :logged_in?, :only => [:destroy]
  def new
      redirect_to messages_path if current_user
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
    session[:user_id] = nil
    flash[:success] = "You have been logged out"
    redirect_to root_path
  end
end
