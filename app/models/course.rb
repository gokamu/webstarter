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

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    name_changed?
  end
end
