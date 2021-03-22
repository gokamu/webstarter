class AssignmentScore < ApplicationRecord
  belongs_to :student, class_name: "Student", foreign_key: "student_id"
  belongs_to :assignment
end
