class Course < ApplicationRecord
  belongs_to :grade
  has_many :notes
  has_many :tests
  has_many :assignments
  has_many :passive_student_courses, class_name: "StudentCourse",
                                     foreign_key: "followed_id",
                                     dependent: :destroy
  has_many :followers, through: :passive_student_courses, source: :follower
  has_many :passive_teacher_courses, class_name: "TeacherCourse",
                                     foreign_key: "followed_id",
                                     dependent: :destroy
  has_many :course_teachers, through: :passive_teacher_courses, source: :follower
end
