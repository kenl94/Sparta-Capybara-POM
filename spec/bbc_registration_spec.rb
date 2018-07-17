require 'spec_helper'

describe "Testing the BBC Registration" do

  context "initial user journey signing up" do

    it "should take us through the correct registration process with valid details" do
      @bbc_site = BBC_Site.new
      # go and get new email
      @bbc_site.get_temp_email.visit_minute_inbox
      # @bbc_site.get_temp_email.refresh_email
      email = @bbc_site.get_temp_email.get_email
      # start the registration process
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_homepage.go_to_register
      @bbc_site.bbc_registration.click_13_or_over
      # pass in the stored email into the method
      @bbc_site.bbc_registration.fill_in_date_of_birth
      @bbc_site.bbc_registration.submit_dob
      @bbc_site.bbc_registration.fill_in_email(email)
      @bbc_site.bbc_registration.fill_in_password
      @bbc_site.bbc_registration.fill_in_postcode
      @bbc_site.bbc_registration.choose_gender
      @bbc_site.bbc_registration.opt_out
      @bbc_site.bbc_registration.registration_button
      expect(@bbc_site.bbc_registration.check_true).to eql "BBC – Register – thank you"
      # expect(@bbc_site.bbc_registration.check_true).to be true
    end
  end
end
