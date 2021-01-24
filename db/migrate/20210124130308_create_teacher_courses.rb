class CreateTeacherCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_courses do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end

    add_index :teacher_courses, :follower_id
    add_index :teacher_courses, :followed_id
    add_index :teacher_courses, [:follower_id, :followed_id], unique: true
  end
end
