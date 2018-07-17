require 'capybara/dsl'

class TempEmail
  include Capybara::DSL

  HOMEPAGE_URL = "https://www.minuteinbox.com"
  EMAIL_TAG = '#email'

  # def initialize
  #   Capybara.register_driver :chrome do |app|
  #     Capybara::Selenium::Driver.new(app, :browser => :chrome)
  #   end
  #   @session = Capybara::Session.new(:chrome)
  # end

  def visit_minute_inbox
    # @session.visit(HOMEPAGE_URL)
    visit(HOMEPAGE_URL)
  end

  def refresh_email
    # @session.click_link "Delete this mailbox"
    # find('').text('Delete this mailbox').click
  end

  def get_email
    # p @session.find(EMAIL_TAG).text
    find(EMAIL_TAG).text
  end

end

# email = TempEmail.new
# email.visit_minute_inbox
# email.refresh_email
# email.get_email
