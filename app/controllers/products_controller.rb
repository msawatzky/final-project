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
    # Get all products
    products = Product.all
    # Get category_id and search text from filter form
    @category_id = params[:category_id].to_i
    @search_text = params[:search_text]
    # If category is chosen filter by category_id
    products = products.where(category_id: @category_id) unless @category_id.zero?
    # If text was entered filter the name by text
    products = products.where('name LIKE ?', "%#{@search_text}%") unless @search_text.empty?
    # Get all categories for dropdown
    @categories = Category.all
    # Set pagination for products
    @products = products.order(price: :desc).page(params[:page]).per(5)
    render 'index'
  end

  def add_to_cart
    id = params[:id].to_i
    session[:cart][id] = 1 unless session[:cart][id]
    render 'cart'
  end

  private

  def initialize_session
    session[:cart] ||= {}
  end
end
