require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Yelpdemo
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    console do
      ActiveRecord::Base.connection
    end

    # Set "--no-test-framework" as a default option when running a generator
    config.generators do |g|
      g.test_framework false
    end

    # https://github.com/plataformatec/responders/issues/94#issuecomment-59538373
    # gem 'devise', '~> 3.4.0' includes responders as a dependency.
    # When a scaffold is being generated, the generator used is the responders' generator.
    # Below will use the Rails' default generator.
    config.app_generators.scaffold_controller :scaffold_controller
  end
end
