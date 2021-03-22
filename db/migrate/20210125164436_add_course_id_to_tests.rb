class AddCourseIdToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :course_id, :integer
  end
end
