class Course < ApplicationRecord
  belongs_to :grade
  has_many :notes
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :passive_teacher_courses, class_name: "TeacherCourse",
                                     foreign_key: "followed_id",
                                     dependent: :destroy
  has_many :course_teachers, through: :passive_teacher_courses, source: :follower
end
