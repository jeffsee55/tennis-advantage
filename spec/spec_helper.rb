ENV["RAILS_ENV"] = "test"

require File.expand_path("../../config/environment", __FILE__)

require "rspec/rails"
require "shoulda/matchers"
require "webmock/rspec"
WebMock.disable_net_connect!(allow_localhost: true)

Dir[Rails.root.join("spec/support/**/*.rb")].each { |file| require file }

module Features
  # Extend this module in spec/support/features/*.rb
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # config.before :each do
  #   stub_request(:post, "https://api.stripe.com/v1/charges").
  #    with(:body => {"amount"=>"200000", "card"=>"", "currency"=>"usd", "description"=>"Charge for Jeff"},
  #         :headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer sk_test_46D1XJWkN3rD4v5ih6Uk711A', 'Content-Length'=>'64', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'Stripe/v1 RubyBindings/1.16.0', 'X-Stripe-Client-User-Agent'=>'{"bindings_version":"1.16.0","lang":"ruby","lang_version":"2.1.2 p95 (2014-05-08)","platform":"x86_64-darwin14.0","publisher":"stripe","uname":"Darwin Jeffs-MacBook-Air.local 14.0.0 Darwin Kernel Version 14.0.0: Fri Sep 19 00:26:44 PDT 2014; root:xnu-2782.1.97~2/RELEASE_X86_64 x86_64"}'}).
  #    to_return(:status => 200, :body => "", :headers => {})
  # end

  config.include SignUserIn, type: :feature
  config.include CheckoutHelpers, type: :feature
  config.include Features, type: :feature
  config.include Formulaic::Dsl, type: :feature
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.use_transactional_fixtures = false
end

ActiveRecord::Migration.maintain_test_schema!
Capybara.javascript_driver = :webkit
WebMock.disable_net_connect!(allow_localhost: true)
