require "bundler/setup"
require "bit_go_client"
require "pry"
require "yaml"
require "pathname"
require "active_support/core_ext/hash/indifferent_access"
require "active_support/core_ext/object/blank"

SPEC_DIR = Pathname.new(File.dirname(__FILE__))
CONFIG = YAML.load_file(SPEC_DIR.join("config.yml")).with_indifferent_access

Dir[SPEC_DIR.join("support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
