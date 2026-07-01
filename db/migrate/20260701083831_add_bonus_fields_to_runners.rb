class AddBonusFieldsToRunners < ActiveRecord::Migration[7.0]
  def change
    add_column :runners, :age, :integer, null: false, default: 0
    add_column :runners, :gender, :string, limit: 3
    add_column :runners, :weight, :decimal, precision: 8, scale: 2
    add_column :runners, :dam, :string
    add_column :runners, :sire, :string
    add_column :runners, :career_earnings, :decimal, precision: 12, scale: 2
  end
end

