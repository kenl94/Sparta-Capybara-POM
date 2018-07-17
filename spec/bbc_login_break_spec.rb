require 'spec_helper'

describe "Breaking the BBC Registration" do

  # context to test the login user journey
  context "testing login" do

    it "should pop up with a message of something missing on username and password as well as sorry those details don't match once sign in is clicked" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.click_submit
      @bbc_site.bbc_login.find_user_name
      @bbc_site.bbc_login.find_password
      expect(@bbc_site.bbc_login.find_user_name).to eql "Something's missing. Please check and try again."
      expect(@bbc_site.bbc_login.find_password).to eql "Something's missing. Please check and try again."
    end

    it "should return message with an error message letting the user know they haven't entered the correct password" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.enter_email
      @bbc_site.bbc_login.enter_wrong_password
      @bbc_site.bbc_login.click_submit
      @bbc_site.bbc_login.find_password
      expect(@bbc_site.bbc_login.find_password).to eql "Uh oh, that password doesn’t match that account. Please try again."
    end

    it "should return that the account doesn't exist if wrong username" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.enter_wrong_email
      @bbc_site.bbc_login.enter_password
      @bbc_site.bbc_login.click_submit
      @bbc_site.bbc_login.no_such_account
      expect(@bbc_site.bbc_login.no_such_account).to eql "Sorry, we can’t find an account with that email. You can register for a new account or get help here."
    end

    it "should let me know that the password I've entered is too short" do

      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.enter_email
      @bbc_site.bbc_login.short_password
      @bbc_site.bbc_login.click_submit
      expect(@bbc_site.bbc_login.short_password_error).to eql "Sorry, that password is too short. It needs to be eight characters or more."
    end

    it "should pop up those details don't match once submit is clicked" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.click_submit
      @bbc_site.bbc_login.find_dont_match
      expect(@bbc_site.bbc_login.find_dont_match).to eql "Sorry, those details don't match. Check you've typed them correctly."
    end

  end

end
