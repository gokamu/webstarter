class Grade < ApplicationRecord
  belongs_to :school
  has_many :courses

  has_many :passive_teacher_grades, class_name: "TeacherGrade",
                                    foreign_key: "followed_id",
                                    dependent: :destroy
  has_many :grade_teachers, through: :passive_teacher_grades, source: :follower
end
