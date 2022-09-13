class RenameSeancesRows < ActiveRecord::Migration[7.0]
  def change
    change_table :seances do |t|
      t.rename :start, :starts_at
      t.rename :end, :finishes_at
    end
  end
end
