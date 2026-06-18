class AddDefaultsToRunnerFields < ActiveRecord::Migration[8.1]
  def change
    change_column_default :runners, :scratched, false
    change_column_default :runners, :finished, false
    change_column_default :runners, :odds, 0.0
  end
end
