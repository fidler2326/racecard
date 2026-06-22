class ChangePoolsOddsDecimalStep < ActiveRecord::Migration[8.1]
  def change
    change_column :pools, :odds, :decimal, precision: 18, scale: 8
    change_column :pools, :total, :decimal, precision: 18, scale: 8
  end
end
