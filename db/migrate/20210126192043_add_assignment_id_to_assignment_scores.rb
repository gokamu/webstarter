class AddAssignmentIdToAssignmentScores < ActiveRecord::Migration[6.0]
  def change
    add_column :assignment_scores, :assignment_id, :integer
  end
end
