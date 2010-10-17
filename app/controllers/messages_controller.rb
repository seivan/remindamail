class MessagesController < ApplicationController
  respond_to :html, :js
  before_filter :logged_in?
  def index
    session[:sent] = params[:sent] ? true : false
    puts "-------------------"
    puts session[:sent]
        puts "-------------------"
    if session[:sent]
      @messages = current_user.messages.sent.arrived_at_asc.paginate(:page => params[:page], :per_page => 5)
    else
      @messages = current_user.messages.queued.created_at_desc.paginate(:page => params[:page], :per_page => 5)
    end
  end
  
  def show
    @message = current_user.messages.where(:id => params[:id]).first
  end
  
  def new
    @message = Message.new
    @message.user_id = current_user.id
    respond_with @message
  end

  def create
    @message = Message.new(params[:message])
    @message.user = current_user
    @message.sent = false
    if @message.save
      if session[:sent]
        @messages = current_user.messages.sent.arrived_at_asc.paginate(:page => params[:page], :per_page => 5)
      else
        @messages = current_user.messages.queued.created_at_desc.paginate(:page => params[:page], :per_page => 5)
      end
    flash[:success] = "Mail is successfully queued and will be sent on #{@message.arrived_at}"
        #Add to mail queue
    else
        flash[:failure] = "Mail was not queued, please fix the errors"
        render :new
    end
  end

end
