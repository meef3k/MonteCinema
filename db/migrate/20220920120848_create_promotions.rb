class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.integer :value, null: false
      t.string :information, null: false

      t.timestamps
    end
  end
end
