class AddOrderProductToProduct < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :order_product, foreign_key: true
  end
end
