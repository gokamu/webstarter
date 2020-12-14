class AddCourseIdToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :course_id, :integer
  end
end
