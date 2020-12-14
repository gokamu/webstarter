class Course < ApplicationRecord
  belongs_to :level
  has_many :notes
end
