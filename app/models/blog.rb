class Blog < ApplicationRecord
    belongs_to :school

    mount_uploader :image, FileUploader
  serialize :image, JSON
end
