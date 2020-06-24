class CreateCartItemes < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_itemes do |t|

      t.timestamps
    end
  end
end
