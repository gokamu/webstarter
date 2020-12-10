class AddCourseIdToSubjects < ActiveRecord::Migration[6.0]
  def change
    add_column :subjects, :course_id, :integer
  end
end
