class Grade < ApplicationRecord
  belongs_to :school
  has_many :courses

  has_many :passive_teacher_grades, class_name: "TeacherGrade",
                                    foreign_key: "followed_id",
                                    dependent: :destroy
  has_many :grade_teachers, through: :passive_teacher_grades, source: :follower

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    name_changed?
  end
end
