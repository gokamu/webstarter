class School < ApplicationRecord
  after_save :update_heroku_domains if :domain.present?

  mount_uploader :logo, FileUploader
  serialize :logo, JSON
  
  has_many :students
  has_many :grades
  has_many :blogs
  belongs_to :admin, class_name: "Admin", foreign_key: "admin_id"
  # extend FriendlyId
  # friendly_id :name, use: [:slugged, :finders]

  # def should_generate_new_friendly_id?
  #   name_changed?
  # end
  private

  def update_heroku_domains
    if self.domain_changed? && self.domain_was.present?
      HerokuDomainJob.perform_later(self.domain_was, "remove")
    end
    HerokuDomainJob.perform_later(self.domain, "add")
  end
end
