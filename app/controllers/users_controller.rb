class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @my_products = @user.products
  end
end
