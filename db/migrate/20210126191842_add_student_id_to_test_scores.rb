class AddStudentIdToTestScores < ActiveRecord::Migration[6.0]
  def change
    add_column :test_scores, :student_id, :integer
  end
end
