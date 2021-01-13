class AddGradeIdToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :grade_id, :integer
  end
end
