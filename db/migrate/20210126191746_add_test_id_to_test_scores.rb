class AddTestIdToTestScores < ActiveRecord::Migration[6.0]
  def change
    add_column :test_scores, :test_id, :integer
  end
end
