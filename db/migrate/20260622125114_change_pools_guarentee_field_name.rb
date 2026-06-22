class ChangePoolsGuarenteeFieldName < ActiveRecord::Migration[8.1]
  def change
    rename_column :pools, :guarentee, :guarantee
  end
end
