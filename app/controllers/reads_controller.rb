class ReadsController < ApplicationController
  before_action :set_message

  def create
    @read = Read.new(user_id: current_user.id,  message_id: @message.id)
    @read.save
  end

  def destroy
    @read = Read.find_by(user_id: current_user.id, message_id:  @message.id)
    @read.destroy
  end

  def show
    
  end

  private

  def set_message
    @room = Room.find_by(id: params[:room_id])
    @message = Message.find_by(id: params[:message_id])
  end
end
