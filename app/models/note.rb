class Note < ApplicationRecord
  belongs_to :course

  mount_uploader :file, FileUploader
  serialize :file, JSON
end
