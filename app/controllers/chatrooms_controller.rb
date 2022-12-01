class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.joins(:messages).where("user = ?", current_user)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @user = @product.Chatroom
    @messages = @chatroom.messages
  end

  # def destroy
  #   @chat = Chatroom.find(params[:id])
  #   @chat.destroy
  #   flash[:success] = "The chat was successfully deleted."
  #   redirect_to chats_path
  # end

end
