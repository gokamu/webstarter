class Admin < ApplicationRecord
  has_many :schools
  has_many :grades, through: :schools
  has_many :courses, through: :grades
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
