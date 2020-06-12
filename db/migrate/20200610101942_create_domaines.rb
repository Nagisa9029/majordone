class CreateDomaines < ActiveRecord::Migration[6.0]
  def change
    create_table :domaines do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :domaines, :name, unique: true
  end
end
