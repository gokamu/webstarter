class Admin < ApplicationRecord
  has_one :school
  has_many :grades, through: :school
  has_many :courses, through: :grades
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
