require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
require 'faker'
require 'json'
require 'ostruct'
require 'rspec'
require 'allure-rspec'
require 'em/pure_ruby'
require 'appium_lib_core'

@rspec_yml = YAML.load_file("#{Dir.pwd}/spec/helpers/rspec.yml")
@ambiente = @rspec_yml['ambiente']

CONFIG = YAML.load_file("#{Dir.pwd}/spec/helpers/data/#{@ambiente}.yml")

opts = {
  capabilities: { # Append capabilities
    platformName: 'android',
    deviceName: 'Nexus6_API30',
    app: "C:\\GitHub\\KotlinAppium\\src\\main\\resources\\alura_esporte.apk",  # Without 'app' capability, an appium session starts with the home screen
    automationName: 'uiautomator2',
    deviceUDID: "emulator-5554",
    autoGrantPermissions: true,
    autoAcceptAlerts: true
  },
  appium_lib: {
    wait: 30
  }
}

AllureRspec.configure do |c|
  c.results_directory = 'report/allure-results'
  c.clean_results_directory = true
end

RSpec.configure do |config|

  #modulo esta como global
  config.color = true
  config.formatter = :documentation

  config.before :all do
    @core = Appium::Core.for(opts) # create a core driver with `opts`
    @driver = @core.start_driver
  end

  config.after :all do
    @core.quit_driver
  end

  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
