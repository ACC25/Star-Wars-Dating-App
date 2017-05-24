require 'rails_helper'

RSpec.describe "user can login" do
  it "works" do
    user = User.create!(username: "Carl", password: "password")
    visit login_path
    save_and_open_page
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"
    assert page.has_content?("Welcome, Carl")
    save_and_open_page
  end
end
