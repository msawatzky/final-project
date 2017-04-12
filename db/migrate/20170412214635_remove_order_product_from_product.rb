class RemoveOrderProductFromProduct < ActiveRecord::Migration[5.0]
  def change
    remove_reference :orders, :order_product
  end
end
