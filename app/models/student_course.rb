class StudentCourse < ApplicationRecord
  belongs_to :follower, class_name: "Student"
  belongs_to :followed, class_name: "Course"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
