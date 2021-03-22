class CreateTeacherGrades < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_grades do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end

    add_index :teacher_grades, :follower_id
    add_index :teacher_grades, :followed_id
    add_index :teacher_grades, [:follower_id, :followed_id], unique: true
  end
end
