class CreateRougeParames < ActiveRecord::Migration[6.0]
  def change
    create_table :rouge_parames do |t|

      t.timestamps
    end
  end
end
