# ghia.diba@lm0k.com

require 'spec_helper'

describe "Testing the BBC Registration" do

  # context to test the login user journey
  context "testing login" do

    it "should respond with success when we login with a valid email and password" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_homepage
      @bbc_site.bbc_login.enter_email
      @bbc_site.bbc_login.enter_password
      @bbc_site.bbc_login.click_submit
      expect(@bbc_site.bbc_login.check_true).to eql "BBC - Home"
    end
  end

end
