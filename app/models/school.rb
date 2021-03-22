class School < ApplicationRecord
  has_many :students
  has_many :grades
  belongs_to :admin, class_name: "Admin", foreign_key: "admin_id"
end
