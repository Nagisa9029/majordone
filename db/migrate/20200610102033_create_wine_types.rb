class CreateWineTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :wine_types do |t|
      t.string :group, null: false

      t.timestamps
    end
    add_index :wine_types, :group, unique: true
  end
end
