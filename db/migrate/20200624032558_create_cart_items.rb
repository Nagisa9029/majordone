class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_kye: true
      t.references :wine, null: false, foreign_kye: true
      t.timestamps
    end
  end
end
