class MessagesController < ApplicationController
  before_action :set_bird
  
  def index
    @messages = @bird.messages.includes(:user).order("id DESC")
  end

  def new
  end

  def create
    redirect_to "/birds/#{@bird.id}/messages" unless (Message.create(message_params)).save
  end

  private

  def set_bird
    @bird = Bird.find(params[:bird_id])
  end

  def message_params
    params.require(:message).permit(:text, :image, :bird_id).merge(user_id: current_user.id)
  end
end