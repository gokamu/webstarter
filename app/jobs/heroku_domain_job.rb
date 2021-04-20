class HerokuDomainJob < ApplicationJob
  queue_as :default

  def perform(custom_domain, action)
    heroku = PlatformAPI.connect_oauth(ENV['HEROKU_API_TOKEN'])

    begin
      case action
      when "add"
        heroku.custom_domain.create(ENV['APP_NAME'], "hostname" => custom_domain)
      when "remove"
        heroku.custom_domain.delete(ENV['APP_NAME'], custom_domain)
      end

    rescue Heroku::API::Errors::RequestFailed => e
      Rails.logger.error "[Heroku Domain Worker] ERROR: #{e}"
    end
  end
end
