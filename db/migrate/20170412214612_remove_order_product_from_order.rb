class RemoveOrderProductFromOrder < ActiveRecord::Migration[5.0]
  def change
    remove_reference :products, :order_product
  end
end
