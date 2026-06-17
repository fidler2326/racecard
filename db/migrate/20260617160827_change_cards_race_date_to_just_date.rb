class ChangeCardsRaceDateToJustDate < ActiveRecord::Migration[8.1]
  def change
    change_column :cards, :race_date, :date, null: false, default: -> { "CURRENT_DATE" }
  end
end
