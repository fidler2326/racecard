class CreateSupportedCurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :supported_currencies do |t|
      t.string :code, null: false
      t.string :name
      t.boolean :active, default: true, null: false

      t.timestamps
    end

    # Enforce database-level unique constraints and performance indexing
    add_index :supported_currencies, :code, unique: true
  end
end

