class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @product = Product.new
  end

  def index
    @user = current_user
    if params[:query] && !params[:query].empty?
      @products = Product.search_a_lot(params[:query])
    else
      @products = Product.all
    end
    @markers = @products.geocoded.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude,
        info_window: render_to_string(partial: "info_window", locals: {product: product})
      }
    end
  end

  def show
    @product = Product.find(params[:id])
    @favorite = Favorite.new
    @user = @product.user
    @products = Product.all
    @markers = @products.geocoded.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude,
        info_window: render_to_string(partial: "info_window", locals: {product: product})
      }
    end
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save!
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
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
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :condition, :material, :price, :dimension, :location, :latitude, :longitude, :spotted, photos: [])
  end
end
