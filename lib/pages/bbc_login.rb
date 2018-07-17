require 'capybara/dsl'

class BBC_Login

  include Capybara::DSL

  EMAIL_NAME = 'username'
  EMAIL = "kaylii.chyanne@lm0k.com"
  PASSWORD_NAME = 'password'
  PASSWORD = "Password@1"
  SUBMIT_BUTTON = '#submit-button'

  def enter_email
    fill_in EMAIL_NAME, with: EMAIL
  end

  def enter_password
    fill_in PASSWORD_NAME, with: PASSWORD
  end

  def click_submit
    find(SUBMIT_BUTTON).click
    sleep 5
  end

  def check_true
    puts find('title').text
  end

end
