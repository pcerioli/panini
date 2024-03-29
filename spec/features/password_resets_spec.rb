require 'spec_helper'

describe "PasswordResets" do
  it "emails user when requesting password reset" do
    user = FactoryGirl.create(:user)
    visit login_path
    click_link "password"
    fill_in "Email", :with => user.email
    click_button "Reset Password"
    current_path.should eq(root_path)
    page.should have_content("email with password reset instructions")
    last_email.to.should include(user.email)
  end

  it "does not email invalid user when requesting password reset" do
    visit login_path
    click_link "password"
    fill_in "Email", :with => "nobody@example.com"
    click_button "Reset Password"
    current_path.should eq(root_path)
    page.should have_content("email with password reset instructions")
    last_email.should be_nil
  end

  # I added the following specs after recording the episode. It literally
  # took about 10 minutes to add the tests and the implementation because
  # it was easy to follow the testing pattern already established.
  it "updates the password when confirmation matches" do
    user = FactoryGirl.create(:user, :password_reset_token => "something123", :password_reset_sent_at => 1.hour.ago)
    visit edit_password_reset_path(user.password_reset_token)
    find('#user_password').set("foobar123")
    click_button "Update Password"
    page.should have_content("Password doesn't match confirmation")
    find('#user_password').set("foobar123")
    find('#user_password_confirmation').set("foobar123")
    click_button "Update Password"
    page.should have_content("Password has been reset")
  end

  it "reports when password token has expired" do
    user = FactoryGirl.create(:user, :password_reset_token => "something123", :password_reset_sent_at => 5.hour.ago)
    visit edit_password_reset_path(user.password_reset_token)
    find('#user_password').set("foobar123")
    find('#user_password_confirmation').set("foobar123")
    click_button "Update Password"
    page.should have_content("Password reset has expired")
  end

  it "raises record not found when password token is invalid" do
    lambda {
      visit edit_password_reset_path("invalid")
    }.should raise_exception(ActiveRecord::RecordNotFound)
  end
end


