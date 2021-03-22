class AddGradeIdToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :grade_id, :integer
  end
end
