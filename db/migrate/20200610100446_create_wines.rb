class CreateWines < ActiveRecord::Migration[6.0]
  def change
    create_table :wines do |t|
      t.string :name, null: false
      t.string :producer
      t.string :type
      t.string :country
      t.string :domeine
      t.integer :price
      t.integer :attack
      t.integer :body
      t.integer :color
      t.integer :flavor
      t.integer :sweetness
      t.integer :bitterness
      t.integer :acidity
      t.integer :taste
      t.integer :tannin
      t.integer :astringency
      t.text :score_image
      t.integer :score

      t.index :price
      t.index :country
      t.index :type
      t.index :name
      t.timestamps
    end
  end
end
