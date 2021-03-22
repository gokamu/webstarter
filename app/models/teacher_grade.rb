class TeacherGrade < ApplicationRecord
  belongs_to :follower, class_name: "Teacher"
  belongs_to :followed, class_name: "Grade"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
