class CreateSeances < ActiveRecord::Migration[7.0]
  def change
    create_table :seances do |t|
      t.datetime :starts_at, null: false
      t.datetime :finishes_at, null: false
      t.decimal :price, null: false
      t.references :hall, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
