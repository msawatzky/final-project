class ProductsController < ApplicationController
  before_action :initialize_session
  def index
    @products = Product.all.order(price: :desc).page(params[:page]).per(5)
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def cart; end

  def filter
    @category_id = params[:category_id].to_i
    @search_text = params[:search_text]

    # Get all products
    @products = Product.filter_by(@category_id, @search_text)

    # Get all categories for dropdown
    @categories = Category.all
    render 'index'
  end

  def add_to_cart
    id = params[:id].to_i
    # cart = session[:cart]
    session[:cart][id] = 1 unless session[:cart].key?(id)
    # session[:cart] = cart
    redirect_to action: 'cart'
  end

  private

  def initialize_session
    session[:cart] ||= {}
  end
end
