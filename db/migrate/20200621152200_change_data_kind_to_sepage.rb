class ChangeDataKindToSepage < ActiveRecord::Migration[6.0]
  def change
    change_column :sepages, :kind, :string
  end
end
