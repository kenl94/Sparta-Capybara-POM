require 'capybara/dsl'

class BBC_Homepage

  include Capybara::DSL

  #Constants
  HOMEPAGE_URL = 'http://www.bbc.co.uk'
  SIGN_IN_LINK_ID = '#idcta-username'
  REGISTER_LINK = 'Register now'

# # Don't need initialize, because it is set up in rspec and it does this before pulling in fules.
# @session is set up in the test, so don't need to set it up
  # def initialize
    # Capybara.register_driver :chrome do |app|
    #   Capybara::Selenium::Driver.new(app, :browser => :chrome)
    # end
    #
    # @session = Capybara::Session.new(:chrome)
  # end

  def visit_home_page
    visit(HOMEPAGE_URL)
    sleep 1
  end

  def click_sign_in_link
    find(SIGN_IN_LINK_ID).click
    sleep 1
  end

  def go_to_register
    # @session.click_link(REGISTER_LINK).
    find('.link--primary').click
    sleep 1
  end

end
