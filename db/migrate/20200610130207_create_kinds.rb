class CreateKinds < ActiveRecord::Migration[6.0]
  def change
    create_table :kinds do |t|
      t.references :wine, null: false, foreign_kye: true
      t.string :name, null: false
      t.timestamps
    end
  end
end
