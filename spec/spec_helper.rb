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
require 'yaml'

$LOCATOR_DIR = File.join(File.dirname(__FILE__), "/tests/locators")
require_relative './helpers/page_helper.rb'

# Define o driver como global, para ler nas Pages.
$driver

# Seta as configurações do device
def device_config(dv)
  opts = {
    capabilities: { # Append capabilities
      platformName: dv['platformName'],
      deviceName: dv['deviceName'],
      app: dv['appPath'],
      automationName: dv['automationName'],
      deviceUDID: dv['deviceUDID'],
      autoGrantPermissions: true,
      autoAcceptAlerts: true
    },
    appium_lib: {
      wait: 30
    }
  }
  return opts
end

# Escolhe o device que vai usar, passando como variavel no comando.
if ENV["device"].to_s == "android"
  device_obj = YAML.load_file("#{Dir.pwd}/spec/helpers/data/android.yml")
  opts = device_config(device_obj)
elsif ENV["device"].to_s == "ios"
  device = YAML.load_file("#{Dir.pwd}/spec/helpers/data/ios.yml")
  opts = device_config(device)
else
  puts "Precisa setar o device  device=android ou device=ios"
end

puts opts

# Adiciona o allure report.
AllureRspec.configure do |c|
  c.results_directory = 'report/allure-results'
  c.clean_results_directory = true
end

RSpec.configure do |config|

  #Adiciona o modulo Pages como global
  include Pages
  config.color = true
  config.formatter = :documentation

  config.before :all do
    @core = Appium::Core.for(opts) # create a core driver with `opts`
    $driver = @core.start_driver
  end

  config.after :all do
    $driver.quit
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
