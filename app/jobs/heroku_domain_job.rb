class HerokuDomainJob < ApplicationJob
  queue_as :default

  def perform(domain, action)
    heroku = PlatformAPI.connect_oauth(ENV['HEROKU_API_TOKEN'])

    begin
      case action
      when "add"
        heroku.domain.create(ENV['APP_NAME'], "hostname" => domain)
      when "remove"
        heroku.domain.delete(ENV['APP_NAME'], domain)
      end

    rescue Heroku::API::Errors::RequestFailed => e
      Rails.logger.error "[Heroku Domain Worker] ERROR: #{e}"
    end
  end
end
