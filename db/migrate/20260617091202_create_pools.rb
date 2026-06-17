class CreatePools < ActiveRecord::Migration[8.1]
  def change
    create_table :pools do |t|
      t.string :pool_code
      t.decimal :odds
      t.string :currency
      t.string :tote
      t.integer :card_id
      t.string :status
      t.integer :first_race_number
      t.decimal :total

      t.timestamps
    end
  end
end
