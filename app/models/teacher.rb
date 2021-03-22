class Teacher < ApplicationRecord
  belongs_to :school

  has_many :active_teacher_grades, class_name: "TeacherGrade",
                                   foreign_key: "follower_id",
                                   dependent: :destroy
  has_many :grade_taught, through: :active_teacher_grades, source: :followed

  has_many :active_teacher_courses, class_name: "TeacherCourse",
                                    foreign_key: "follower_id",
                                    dependent: :destroy
  has_many :course_taught, through: :active_teacher_courses, source: :followed

  # Follows a grade.
  def add_teacher_to_grade(other_grade)
    grade_taught << other_grade unless self == other_grade
  end

  # Unfollows a grade.
  def remove_teacher_from_grade(other_grade)
    grade_taught.delete(other_grade)
  end

  # Returns true if the teacher is teaching other grade.
  def grade_taught?(other_grade)
    grade_taught.include?(other_grade)
  end

  # Follows a course.
  def add_teacher_to_course(other_course)
    course_taught << other_course unless self == other_course
  end

  # Unfollows a course.
  def remove_teacher_from_course(other_course)
    course_taught.delete(other_course)
  end

  # Returns true if the teacher is teaching other course.
  def course_taught?(other_course)
    course_taught.include?(other_course)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
