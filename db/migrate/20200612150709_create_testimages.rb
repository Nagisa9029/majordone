class CreateTestimages < ActiveRecord::Migration[6.0]
  def change
    create_table :testimages do |t|
      t.text :image, null: false
      t.timestamps
    end
  end
end