class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
    reads = Read.all
    
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message, user: @message.user, time: @message.created_at.strftime("%Y/%m/%d %H:%M")
    else
      @messages = @room.messages.includes(:user)
      render :index
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
    params.require(:message).permit(:content, images: []).merge(user_id: current_user.id)
  end
end