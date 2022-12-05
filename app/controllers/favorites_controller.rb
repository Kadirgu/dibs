class FavoritesController < ApplicationController
  include ActionView::RecordIdentifier

  def index
    @favorites = current_user.favorites
  end

  def create
    @user = current_user
    @product = Product.find(params[:product_id])
    @favorite = Favorite.new(user_id: @user.id, product_id: @product.id)
    if @favorite.save
      if request.referrer.include?("products/")
        redirect_to product_path(@product)
      else
        redirect_to products_path(anchor: dom_id(@product)) # Sebi tried to get anchors working
      end
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to favorites_path, status: :see_other
  end
end

