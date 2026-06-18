class AddCourseToCards < ActiveRecord::Migration[8.1]
  def change
    add_column :cards, :course, :string, null: false
  end
end
