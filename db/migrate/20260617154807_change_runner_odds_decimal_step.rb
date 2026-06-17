class ChangeRunnerOddsDecimalStep < ActiveRecord::Migration[8.1]
  def change
    change_column :runners, :odds, :decimal, precision: 18, scale: 8
  end
end
