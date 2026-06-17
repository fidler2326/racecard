class CreateLegs < ActiveRecord::Migration[8.1]
  def change
    create_table :legs do |t|
      t.integer :card_id
      t.integer :race_id
      t.integer :pool_id

      t.timestamps
    end
  end
end
