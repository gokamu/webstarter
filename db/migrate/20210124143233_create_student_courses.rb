class CreateStudentCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :student_courses do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end

    add_index :student_courses, :follower_id
    add_index :student_courses, :followed_id
    add_index :student_courses, [:follower_id, :followed_id], unique: true
  end
end
