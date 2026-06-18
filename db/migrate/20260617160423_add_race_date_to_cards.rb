class AddRaceDateToCards < ActiveRecord::Migration[8.1]
  def change
    add_column :cards, :race_date, :datetime, null: false, default: -> { "CURRENT_TIMESTAMP" }
  end
end
