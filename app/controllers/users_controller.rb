class UsersController < ApplicationController

  def show
    @user = current_user
    @my_products = @user.products
  end
end
