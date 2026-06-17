class CreateRunners < ActiveRecord::Migration[8.1]
  def change
    create_table :runners do |t|
      t.string :name
      t.string :number
      t.string :trainer
      t.string :jockey
      t.string :program_number
      t.integer :race_id
      t.integer :card_id
      t.integer :finish_positon
      t.boolean :scratched
      t.boolean :finished
      t.decimal :odds

      t.timestamps
    end
  end
end
