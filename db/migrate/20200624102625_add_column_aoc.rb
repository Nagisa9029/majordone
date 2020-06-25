class AddColumnAoc < ActiveRecord::Migration[6.0]
  def change
    add_column :domaines, :flag, :text
    add_column :wines, :aoc, :string
    add_column :wines, :cuisine, :string
  end
end
