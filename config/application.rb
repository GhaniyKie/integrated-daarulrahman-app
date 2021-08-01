require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module IntegratedDaarulrahmanApp
    class Application < Rails::Application
        # Initialize configuration defaults for originally generated Rails version.
        config.load_defaults 6.1

        config.exceptions_app = self.routes

        config.middleware.insert_before 0, Rack::Cors do
            allow do
                origins '*'
                resource '*', headers: :any, methods: [:get, :post, :put, :delete, :options, :patch, :head]
            end
        end
        
        # =========== ASSETS PIPELINE ============ #
        config.assets.paths << Rails.root.join('app', 'assets', 'images')
    
        Dir.glob("#{Rails.root}/app/assets/images/**/").each do |path|
          config.assets.paths << path
        end
        # ======================================== #

        # Configuration for the application, engines, and railties goes here.
        #
        # These settings can be overridden in specific environments using the files
        # in config/environments, which are processed later.
        #
        config.time_zone = "Asia/Jakarta"
        # config.eager_load_paths << Rails.root.join("extras")
        config.i18n.default_locale = :id
    end
end
