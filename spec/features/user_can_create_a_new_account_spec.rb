require 'rails_helper'

RSpec.describe "user can create an account" do
  it "can fill in the new account form" do
      visit new_user_path
      fill_in "Username", with: "Carl"
      fill_in "Password", with: "password"
      click_button "Create Account"
      assert page.has_content?("Carl")
  end

  it "login button can be found" do
    user = User.create!(username: "Carl", password: "password")
    visit root_path
    expect(current_path).to eq '/'
  end

end
