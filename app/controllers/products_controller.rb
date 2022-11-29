class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query] && !params[:query].empty?
      @product = Product.search_a_lot(params[:query])
    else
      @product = Product.all
    end
    # @markers = @friend_services.geocoded.map do |friend_service|
    #   {
    #     lat: friend_service.latitude,
    #     lng: friend_service.longitude,
    #     info_window: render_to_string(partial: "info_window", locals: {friend_service: friend_service})
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
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save!
      redirect_to products_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
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

end
