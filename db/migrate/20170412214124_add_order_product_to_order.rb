class AddOrderProductToOrder < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :order_product, foreign_key: true
  end
end
