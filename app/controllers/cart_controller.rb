class CartController < ApplicationController
  before_action :initialize_session

  def index; end

  def add_to_cart
    id = params[:id].to_i
    session[:cart][id] ||= 1
    redirect_to action: 'index'
  end

  def update_quantity
  end

  private

  def initialize_session
    session[:cart] ||= {}
  end
end
