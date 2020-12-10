class Course < ApplicationRecord
  belongs_to :portal
  has_many :subjects
end
