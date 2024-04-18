class RenameShoppingCostColumnToOrders < ActiveRecord::Migration[6.1]
  def change
     rename_column :orders, :shopping_cost, :shipping_cost
  end
end
