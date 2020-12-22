class AddSchoolIdToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :school_id, :integer
  end
end
