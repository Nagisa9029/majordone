class CreateSepages < ActiveRecord::Migration[6.0]
  def change
    create_table :sepages do |t|
      t.integer :kind
      t.string :name, null: false
      t.string :name_spell
      t.text :text

      t.timestamps
    end
    add_index :sepages, :name, unique: true
    add_index :sepages, :name_spell, unique: true
    add_index :sepages, :kind, unique: true
  end
end
