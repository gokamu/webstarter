class Assignment < ApplicationRecord
  belongs_to :course
  has_many :assignment_scores
  mount_uploader :file, FileUploader
  serialize :file, JSON

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    name_changed?
  end
end
