class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
    @user = @product.message
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    flash[:success] = "The message was successfully deleted."
    redirect_to messages_path
  end

  

end
