require 'rails_helper'

RSpec.describe "user can create an account" do
  it "can fill in the new account form" do
      visit new_user_path
      fill_in "Username", with: "Carl"
      fill_in "Password", with: "password"
      click_button "Create Account"
      assert page.has_content?("Welcome, Carl")
      save_and_open_page
  end

end
