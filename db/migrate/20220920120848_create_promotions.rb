class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.integer :amount, null: false
      t.string :value, null: false

      t.timestamps
    end
  end
end
