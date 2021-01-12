class Admin < ApplicationRecord
  has_many :schools
  has_many :portals, through: :schools
  has_many :courses, through: :portals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
