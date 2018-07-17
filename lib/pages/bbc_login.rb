require 'capybara/dsl'

class BBC_Login

  include Capybara::DSL

  EMAIL_NAME = 'username'
  EMAIL = "kaylii.chyanne@lm0k.com"
  PASSWORD_NAME = 'password'
  PASSWORD = "Password@1"
  SUBMIT_BUTTON = '#submit-button'
  USERNAME_MISSING = "#form-message-username"
  PASSWORD_MISSING = "#form-message-password"
  DONT_MATCH = "#form-message-general > p > span > span:nth-child(1)"
  WRONG_PASSWORD = "WRONGPASSWORD@1"
  WRONG_EMAIL = "alianis.mili@lm0k.com"
  NO_ACCOUNT = "#form-message-username > p"
  SHORT_PASSWORD = "short@1"
  SHORT_PASSWORD_ERROR = "#form-message-password > p"



  def enter_email
    fill_in EMAIL_NAME, with: EMAIL
    sleep 1
  end

  def enter_password
    fill_in PASSWORD_NAME, with: PASSWORD
    sleep 1
  end

  def enter_wrong_password
    fill_in PASSWORD_NAME, with: WRONG_PASSWORD
    sleep 1
  end

  def click_submit
    find(SUBMIT_BUTTON).click
    sleep 5
  end

  def check_true
    find('title').text
  end

  def find_user_name
    find(USERNAME_MISSING).text
  end

  def find_password
    find(PASSWORD_MISSING).text
  end

  def find_dont_match
    find(DONT_MATCH).text
  end

  def enter_wrong_email
    fill_in EMAIL_NAME, with: WRONG_EMAIL
  end

  def no_such_account
    find(NO_ACCOUNT).text
  end

  def short_password
    fill_in PASSWORD_NAME, with: SHORT_PASSWORD
  end

  def short_password_error
    find(SHORT_PASSWORD_ERROR).text
  end
end
