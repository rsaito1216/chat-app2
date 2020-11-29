class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
    @users = User.all
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  def edit
    @room = Room.find(params[:id])
    @message = @room.messages.find(params[:id])
  end

  def update
    if @message.update(room_params)
      redirect_to root_path
    else
      render action: :edit
    end
  end

  def destroy
    @room = Room.find(params[:room_id])
    message = Message.find_by(room_id: params[:room_id],id: params[:id])
    message.destroy
    redirect_to room_messages_path(@room)
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end