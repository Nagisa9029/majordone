class CreateSparklingParames < ActiveRecord::Migration[6.0]
  def change
    create_table :sparkling_parames do |t|

      t.timestamps
    end
  end
end
