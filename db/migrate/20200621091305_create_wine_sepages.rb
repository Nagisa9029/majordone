class CreateWineSepages < ActiveRecord::Migration[6.0]
  def change
    create_table :wine_sepages do |t|
      t.references :wine, null: false, foreign_kye: true
      t.references :sepage, null: false, foreign_kye: true
      t.timestamps
    end
  end
end