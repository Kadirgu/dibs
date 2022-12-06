class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.where(user: current_user).or Chatroom.where(product: current_user.products)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @messages = @chatroom.messages
  end

  def create
    @product = Product.find(params[:product_id])
    @chatroom = Chatroom.find_by(product: params[:product_id], user_id: current_user.id)
    if @chatroom.nil?
      @chatroom = Chatroom.create(product: @product, user_id: current_user.id)
      @message = Message.new
      render "chatrooms/show", status: :unprocessable_entity
    else
      redirect_to chatroom_path(@chatroom)
    end
  end

  # def destroy
  #   @chat = Chatroom.find(params[:id])
  #   @chat.destroy
  #   flash[:success] = "The chat was successfully deleted."
  #   redirect_to chats_path
  # end

end
