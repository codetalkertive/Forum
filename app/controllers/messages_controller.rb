class MessagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  	@messages = Message.all.order("created_at DESC")
  end

  def new
  	@message = Message.new
  end

  def create
  	@message = Message.create(message_params)
  	if @message.save
  		redirect_to @message
  	else
  		render :new
  	end
  end

  def show
  	@message = Message.find(params[:id])
  end

  def edit
  	@message = Message.find(params[:id])
  end

  def update
  	@message = Message.find(params[:id])

  	if @message.update(message_params)
  		redirect_to @message
  	else
  		render :edit
  	end
  end

  def destroy
  	@message = Message.find(params[:id])

  	@message.destroy
  	redirect_to :action => :index
  end

  private

  def message_params
  	params.require(:message).permit(:title, :description)
  end
end
