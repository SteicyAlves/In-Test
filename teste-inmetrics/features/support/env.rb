require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'faker'
require 'factory_bot'
require 'httparty'
require 'money'

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["ENV_TYPE"]}.yaml"))

require_relative 'helpers.rb'
require_relative 'libs/employee_factory'
require_relative 'services/employee_service'
require_relative 'libs/user_factory'

World(Helpers)

case ENV["BROWSER"]
when "firefox"
  @driver = :selenium
when "chrome"
  @driver = :selenium_chrome
when "internet_explorer"
  @driver = :ie
else
  puts "Invalid Browser"
end

Capybara.configure do |config|

  Capybara.register_driver :ie do |app|
    Capybara::Selenium::Driver.new(app, :browser => :ie)
  end

  config.default_driver = @driver
  config.app_host = CONFIG['url']
  config.default_max_wait_time = 10
end