require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Survey
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec, view_specs: false,
          fixture: true,
          fixture_replacement: 'factory_girl'
      g.assets = false
      g.helper = false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end


    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end



