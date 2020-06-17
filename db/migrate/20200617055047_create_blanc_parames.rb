class CreateBlancParames < ActiveRecord::Migration[6.0]
  def change
    create_table :blanc_parames do |t|

      t.timestamps
    end
  end
end
