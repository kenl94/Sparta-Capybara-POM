require 'capybara/dsl'

class BBC_Registration

  include Capybara::DSL

  #Constants
  OVER_THIRTEEN = "13 or over"
  DAY = "dateOfBirthDay"
  MONTH = "dateOfBirthMonth"
  YEAR = "dateOfBirthYear"
  DOB_BUTTON = '#submit-button'
  EMAIL_INPUT = 'Email'
  PASSWORD_INPUT = 'Password'
  POSTCODE = 'Postcode'
  REGISTRATION_SUBMIT = '#submit-button'

# # Don't need initialize, because it is set up in rspec and it does this before pulling in fules.
# @session is set up in the test, so don't need to set it up
  # def initialize
  #   Capybara.register_driver :chrome do |app|
  #     Capybara::Selenium::Driver.new(app, :browser => :chrome)
  #   end
  #   @session = Capybara::Session.new(:chrome)
  # end

  def click_13_or_over
    click_link(OVER_THIRTEEN)
    sleep 1
  end

  def fill_in_date_of_birth
    fill_in DAY, with: "27"
    sleep 1
    fill_in MONTH, with: "07"
    sleep 1
    fill_in YEAR, with: "1994"
    sleep 1
  end

  def submit_dob
    find(DOB_BUTTON).click
    # @session.click_button 'Continue'
    sleep 1
  end

  def fill_in_email(email)
    fill_in EMAIL_INPUT, with: email
    sleep 1
  end

  def fill_in_password
    fill_in PASSWORD_INPUT, with: "Password@1"
    sleep 1
  end

  def fill_in_postcode
    fill_in POSTCODE, with: "TW10 6TF"
    sleep 1
  end

  def choose_gender
    select 'Male', from: 'Gender'
    sleep 1
  end

  def opt_out
    # all('.button__text-wrapper')[1].click
    # @session.find_button("")
    all('.button__text-wrapper').each do |x|
      if x.text == "No, thanks"
        x.click[1]
      end
    end
    sleep 2
  end

  def registration_button
    find(REGISTRATION_SUBMIT).click
    sleep 5
  end

  def check_true
    find('title').text
    # has_content?("Thanks. You're now signed in.")
  end

end
