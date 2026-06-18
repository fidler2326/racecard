class RenameRunnerFinishPositionField < ActiveRecord::Migration[8.1]
  def change
    rename_column :runners, :finish_positon, :finish_position
  end
end
