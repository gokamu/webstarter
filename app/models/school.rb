class School < ApplicationRecord
  has_many :students
  has_many :grades
  belongs_to :admin, class_name: "Admin", foreign_key: "admin_id"
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    name_changed?
  end
end
