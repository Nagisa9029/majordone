class AddColumnNum < ActiveRecord::Migration[6.0]
  def change
    add_column :cart_items, :purchase_num, :integer, default: 1
  end
end
