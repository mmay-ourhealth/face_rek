require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FaceRek
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

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.autoload_paths += Dir[Rails.root.join('app', 'models', '{**}')]
    # config.autoload_paths += Dir[Rails.root.join('app', 'forms', '{**}')]
    # config.autoload_paths += Dir[Rails.root.join('app', 'processors', '{**}')]
    # config.autoload_paths += Dir[Rails.root.join('app', 'decorators', '{**}')]
    # config.autoload_paths += Dir[Rails.root.join('app', 'interactors', '{**}')]
    # config.autoload_paths += Dir[Rails.root.join('app', 'wizard_validators', '{**}')]
    config.autoload_paths += %W(#{config.root}/lib)
    config.eager_load_paths += %W(#{config.root}/lib)



    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.view_specs false
      g.helper_specs false
      g.request_specs false
      g.jbuilder false
      g.factory_girl suffix: "factory", dir: "test/factories"
    end
  end
end
