class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :email, null: false
      t.integer :status, default: 0, null: false
      t.references :seance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
