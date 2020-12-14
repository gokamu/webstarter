class School < ApplicationRecord
  has_one :portal
  belongs_to :admin, class_name: "Admin", foreign_key: "admin_id"
end
