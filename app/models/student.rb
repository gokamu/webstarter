class Student < ApplicationRecord
  belongs_to :school
  has_many :active_student_courses, class_name: "StudentCourse",
                                    foreign_key: "follower_id",
                                    dependent: :destroy
  has_many :following, through: :active_student_courses, source: :followed
  # Follows a course.
  def follow(other_course)
    following << other_course unless self == other_course
  end

  # Unfollows a course.
  def unfollow(other_course)
    following.delete(other_course)
  end

  # Returns true if the student is following the other course.
  def following?(other_course)
    following.include?(other_course)
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
