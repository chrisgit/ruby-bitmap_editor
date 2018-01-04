require 'bitmap_editor'
require 'support/bitmaptesthelper'
require 'shared/parameters'
require 'shared/bitmap'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.alias_it_behaves_like_to :it_throws_when, 'throws exception when'
end
