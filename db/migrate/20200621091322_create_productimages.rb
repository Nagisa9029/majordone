class CreateProductimages < ActiveRecord::Migration[6.0]
  def change
    create_table :productimages do |t|
      t.references :wine, null: false, foreign_kye: true
      t.text :image, null: false
      t.timestamps
    end
  end
end
