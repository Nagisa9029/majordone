class AddColumnWines < ActiveRecord::Migration[6.0]
  def change
    add_column :wines, :wine_flg, :boolean, null: false, default: false
    remove_index :sepages, :kind
    add_index :sepages, :kind
  end
end
