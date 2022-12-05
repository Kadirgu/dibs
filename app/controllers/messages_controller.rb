class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
    @user = @product.message
  end

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "chatrooms/message", locals: {message: @message})
      )
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    flash[:success] = "The message was successfully deleted."
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
