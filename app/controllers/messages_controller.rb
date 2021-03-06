class MessagesController < ApplicationController
  before_action :set_bird
  
  def index
    @messages = @bird.messages.includes(:user).order("id DESC").page(params[:page]).per(10)
  end

  def new
  end

  def create
    move_to_bird_show unless (Message.create(message_params)).save
  end

  def edit
    @message = find_message
  end

  def update
    message = find_message
    message.update(message_params) if message.user_id == current_user.id
    move_to_bird_show
  end

  def destroy
    message = find_message
    message.destroy if message.user_id == current_user.id
    move_to_bird_show
  end

  private

  def set_bird
    @bird = Bird.find(params[:bird_id])
  end

  def find_message
    Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:text, :image, :bird_id).merge(user_id: current_user.id)
  end

  def move_to_bird_show
    redirect_to "/birds/#{@bird.id}/messages"
  end
end