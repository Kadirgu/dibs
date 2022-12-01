class FavoritesController < ApplicationController

  def new
    @favorite = Favorite.new
  end

  def index
    @user = current_user
    @favorites = Favorite.all
  end

  def create
    @user = current_user
    @favorite = Favorite.new(user_id: @user)
  end

  def show
    @user = current_user
    @products = Product.all
    @my_favorite_products = @user.products.all
  end
end
