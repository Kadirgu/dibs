class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @product = Product.new
  end

  def index
    @user = current_user
    if params[:query] || params[:categories]
      @search_products = []
      if params[:query]
        @search_products << Product.search_a_lot(params[:query])
      end
      if params[:categories]
        params[:categories].each do |cat|
          @search_products << Product.search_a_lot(cat.downcase)
        end
      end
      @products = @search_products.flatten
      return @products
    else
      @products = Product.all.by_recently_created
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
    @product_array = Product.where(id: params[:id])
    @product = @product_array.first
    @favorite = Favorite.new
    @user = @product.user
    @chatroom = Chatroom.where(product: @product, user: current_user)
    @markers = @product_array.geocoded.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude,
        info_window: render_to_string(partial: "info_window", locals: {product: product})
      }
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.material
      @product.material = params[:product][:material].join(", ")
    end
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
    params.require(:product).permit(:title, :description, :condition, :category, :material, :price, :dimension, :location, :latitude, :longitude, :spotted, photos: [])
  end
end
