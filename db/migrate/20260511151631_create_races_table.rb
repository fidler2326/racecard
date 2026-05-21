class CreateRacesTable < ActiveRecord::Migration[8.1]
  def change
    create_table :races do |t|
      t.string :name
      t.integer :number
      t.datetime :time
      t.integer :card_id
      t.timestamps
    end
  end
end
