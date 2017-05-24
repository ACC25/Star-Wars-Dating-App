require 'rails_helper'

RSpec.describe "user can navigate to match page" do
  it "can talk to the api" do
    user = User.create!(username: "Carl", password: "password")
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"
    assert page.has_content?("Carl")

    click_link "Find a new match"
    save_and_open_page
  end
end
