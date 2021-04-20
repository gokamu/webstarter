class School < ApplicationRecord
  after_save :update_heroku_domains if :domain.present?

  mount_uploader :logo, FileUploader
  serialize :logo, JSON

  # after_save do |school|  
  #   heroku_environments = %w(production staging)
  #   if school.custom_domain && (heroku_environments.include? Rails.env)
  #     added = false
  #     heroku = Heroku::API.new(api_key: ENV['HEROKU_API_KEY'])
  #     heroku.get_custom_domains(ENV['APP_NAME']).data[:body].each do |custom_domain|
  #       added = true if custom_domain['custom_domain'] == school.custom_domain
  #     end
  
  #     unless added
  #       heroku.post_custom_domain(ENV['APP_NAME'], school.custom_domain)
  #       heroku.post_custom_domain(ENV['APP_NAME'], "www.#{school.custom_domain}")
  #     end
  #   end
  # end 
  
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
