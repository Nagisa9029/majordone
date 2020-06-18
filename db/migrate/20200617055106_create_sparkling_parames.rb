class CreateSparklingParames < ActiveRecord::Migration[6.0]
  def change
    create_table :sparkling_parames do |t|
      t.references :user, null: false, foreign_kye: true
      t.integer :attack, null: false, default: 0
      t.integer :body, null: false, default: 0
      t.integer :color, null: false, default: 0
      t.integer :flavor, null: false, default: 0
      t.integer :fruit_flavor, null: false, default: 0
      t.integer :sweetness, null: false, default: 0
      t.integer :bitterness, null: false, default: 0
      t.integer :acidity, null: false, default: 0
      t.integer :taste, null: false, default: 0
      t.text :score_image, null: false
      t.integer :score
      t.timestamps
    end
  end
end
