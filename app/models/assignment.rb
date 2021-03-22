class Assignment < ApplicationRecord
  belongs_to :course
  has_many :assignment_scores
  mount_uploader :file, FileUploader
  serialize :file, JSON
end
