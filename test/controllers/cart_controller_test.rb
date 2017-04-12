require 'test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest
  test "should get add_to_cart" do
    get cart_add_to_cart_url
    assert_response :success
  end

  test "should get update_quantity" do
    get cart_update_quantity_url
    assert_response :success
  end

end
