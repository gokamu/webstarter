class AddSchoolIdToGrades < ActiveRecord::Migration[6.0]
  def change
    add_column :grades, :school_id, :integer
  end
end
