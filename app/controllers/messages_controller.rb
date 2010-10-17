class MessagesController < ApplicationController
  respond_to :html, :js
  before_filter :signed_in?
  def index
    sent_status =  params[:sent] == "true" ? true : false
    @messages = current_user.messages.
                  where(:sent => sent_status).
                  paginate(:page => params[:page], :per_page => 2)
  end
  
  def show
    @message = current_user.messages.
                  where(:id => params[:id])
  end

  def new
    @message = Message.new
    @message.user_id = current_user.id
    respond_with @message
  end

  def create
    @message = Message.new(params[:message])
    @message.user = current_user
    if @message.save
      flash[:success] = "Mail is successfully queued and will be sent on #{@message.arrived_at}"
        #Add to mail queue
      redirect_to messages_path
    else
        flash[:failure] = "Mail was not queued, please fix the errors"
        render :action => "new"
    end
  end

end
