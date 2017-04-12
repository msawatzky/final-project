class ProductsController < ApplicationController
  def index
    @products = Product.all.order(price: :desc).page(params[:page]).per(5)
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def filter
    @category_id = params[:category_id].to_i
    @search_text = params[:search_text]

    # Get all products
    @products = Product.filter_by(@category_id, @search_text)

    # Get all categories for dropdown
    @categories = Category.all
    render 'index'
  end
end
