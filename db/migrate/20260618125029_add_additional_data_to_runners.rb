class AddAdditionalDataToRunners < ActiveRecord::Migration[8.1]
  def change
    add_column :runners, :additional_data, :text, null: true
    add_column :runners, :past_performances, :text, null: true
    add_column :runners, :form, :string
  end
end
