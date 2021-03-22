class Student < ApplicationRecord
  attr_accessor :login
  validates_uniqueness_of :username
  belongs_to :school
  has_many :test_score
  has_many :assignment_score
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

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    name_changed?
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



         def self.find_for_database_authentication warden_condition
          conditions = warden_condition.dup
          login = conditions.delete(:login)
          where(conditions).where(
            ["lower(username) = :value OR lower(email) = :value",
            { value: login.strip.downcase}]).first
        end
end
