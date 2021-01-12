class Portal < ApplicationRecord
  belongs_to :school
  has_many :courses
end
