class ChatsController < ApplicationController

  def index
    @chats = Chat.all
  end

  def show
    @chat = Chat.find(params[:id])
    @user = @product.chat
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    flash[:success] = "The chat was successfully deleted."
    redirect_to chats_path
  end

end
