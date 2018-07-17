require 'capybara'
require_relative '../lib/bbc_site.rb'

RSpec.configure do |config|
  config.formatter = :documentation
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.configure do |config|
# Makes sure that all hidden eleents on a page are avaialble
  config.ignore_hidden_elements = false
  # Wait time for asynchronous processes to finish
  # asynchronous, makes sure they work independently of each other, so you don't have to wait for a test to finish before another begins?
  config.default_max_wait_time = 10
  # ensures the default driver is chrome
  config.default_driver = :chrome
end
