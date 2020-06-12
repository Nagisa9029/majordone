class CreateWines < ActiveRecord::Migration[6.0]
  def change
    create_table :wines do |t|
      t.string :name, null: false
      t.string :name_spell
      t.text :title
      t.text :comment
      t.string :producer
      t.references :wine_type, null: false, foreign_kye: true
      t.references :domaine, null: false, foreign_kye: true
      t.string :chator
      t.integer :price
      t.integer :attack
      t.integer :body
      t.integer :color
      t.integer :flavor
      t.integer :fruit_flavor
      t.integer :sweetness
      t.integer :bitterness
      t.integer :acidity
      t.integer :taste
      t.integer :tannin
      t.integer :astringency
      t.text :score_image
      t.integer :score

      t.timestamps
    end
    add_index :wines, :name, unique: true
    add_index :wines, :name_spell, unique: true
  end
end