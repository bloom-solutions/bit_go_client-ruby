require 'vcr'
require "webmock"

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!

  %i[
    access_token
  ].each do |var|
    c.filter_sensitive_data(CONFIG[var]) { "[#{var}]"}
  end
end
