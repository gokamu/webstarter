class AddStudentIdToAssignmentScores < ActiveRecord::Migration[6.0]
  def change
    add_column :assignment_scores, :student_id, :integer
  end
end
