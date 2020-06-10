class AddTypeToSepages < ActiveRecord::Migration[6.0]
  def change
    add_column :sepages, :type, :string
  end
end
