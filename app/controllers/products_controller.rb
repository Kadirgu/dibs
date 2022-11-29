class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query] && !params[:query].empty?
      @product = Product.search_a_lot(params[:query])
    else
      @product = Product.all
    end

    # @markers = @products.geocoded.map do |product|
    #   {
    #     lat: product.latitude,
    #     lng: product.longitude,
    #     info_window: render_to_string(partial: "info_window", locals: {product: product})
    #   }
    # end
  end

  def show
    @product = Prodcut.find(params[:id])
    @product = Product.new
    @user = @product.user
  end

  def new
    @product = Product.new
    @favorite = Favorite.new
    @user = @product.user
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save!
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:success] = "The product was successfully destroyed."
    redirect_to product_path
  end


    private


    def product_params
      params.require(:friend_service).permit(:title, :description, :condition, :material, :price, :dimension, :location, :spotted, :photo, :latitude, :longitude )
    end
  end
end
