class Test < ApplicationRecord
  belongs_to :course
  has_many :test_scores
  mount_uploader :file, FileUploader
  serialize :file, JSON
end
