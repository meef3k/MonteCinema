class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.integer :duration

      t.timestamps
    end
  end
end
