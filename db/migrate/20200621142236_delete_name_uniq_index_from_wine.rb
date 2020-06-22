class DeleteNameUniqIndexFromWine < ActiveRecord::Migration[6.0]
  def change
    remove_index :wines, :name
    remove_index :wines, :name_spell
    add_index :wines, :name
    add_index :wines, :name_spell
    add_column :wines, :taste_comment, :text
  end
end
