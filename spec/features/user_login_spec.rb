require 'rails_helper'

RSpec.describe "user can login" do
  it "lets an existing user login" do
    user = User.create!(username: "Carl", password: "password")
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"
    assert page.has_content?("Carl")
  end

end
