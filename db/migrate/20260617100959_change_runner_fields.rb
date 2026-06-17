class ChangeRunnerFields < ActiveRecord::Migration[8.1]
  def change
    change_column :runners, :number, :integer
  end
end
