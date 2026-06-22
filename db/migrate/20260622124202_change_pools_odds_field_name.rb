class ChangePoolsOddsFieldName < ActiveRecord::Migration[8.1]
  def change
    rename_column :pools, :odds, :guarentee
    add_column :pools, :carryover, :decimal, precision: 18, scale: 8, null: false, default: 0.0
  end
end
