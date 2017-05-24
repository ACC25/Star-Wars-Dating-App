require 'rails_helper'

RSpec.describe "user can log out" do
  it "lets an existing user log out" do
    user = User.create!(username: "Carl", password: "password")
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"
    assert page.has_content?("Carl")

    click_link "Logout"
    refute page.has_content?("Carl")
  end
end
