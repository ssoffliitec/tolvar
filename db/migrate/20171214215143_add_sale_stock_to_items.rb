class AddSaleStockToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :sale_stock, :integer
  end
end
