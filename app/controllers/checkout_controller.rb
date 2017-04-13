class CheckoutController < ApplicationController
  SALES_TAX_BY_PROVINCE = { 'MB' => 0.08,
                            'AB' => 0,
                            'SK' => 0.06,
                            'QC' => 0.05 }.freeze # .freeze makes hash immutable
  GST = 0.05

  def index
    address = params[:address]
    province_code = params[:province]

    @subtotal = 0

    # Create the user
    @new_user = User.create(address: address, province_code: province_code)

    # Create the order
    @new_order = Order.create(user: @new_user)

    # Create the order products and tally up the subtotal
    session[:cart].each do |key, quantity|
      product = Product.find(key)
      OrderProduct.create(quantity: quantity, product: product, order: @new_order)

      @subtotal += (product.price * quantity)
    end
    @taxes = @subtotal * (SALES_TAX_BY_PROVINCE[province_code] + GST)
    @total = @subtotal + @taxes

    # Set session has to a variable
    @cart_hash = session[:cart]

    # Clear cart session
    session.delete(:cart)
  end
end
