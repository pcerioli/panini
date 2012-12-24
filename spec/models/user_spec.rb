require 'spec_helper'

describe User do
  describe "#send_password_reset" do
    let(:user) { FactoryGirl.create(:user) }


    it "should have valid factory" do
        user.should be_valid
    end

    it "should require full name" do
        FactoryGirl.build(:user, :fullname => "").should_not be_valid
    end

  
    it "should not have a duplicate email address" do
      user = FactoryGirl.create(:user, :email => "user@example.com")
      FactoryGirl.build(:user, :email => "user@example.com").should_not be_valid
    end


    it "generates a unique password_reset_token each time" do
      user.send_password_reset
      last_token = user.password_reset_token
      user.send_password_reset
      user.password_reset_token.should_not eq(last_token)
    end

    it "saves the time the password reset was sent" do
      user.send_password_reset
      user.reload.password_reset_sent_at.should be_present
    end

    it "delivers email to user" do
      user.send_password_reset
      last_email.to.should include (user.email)
    end
  end
end