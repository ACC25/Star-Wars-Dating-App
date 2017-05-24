require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user can be created" do
    visit new_user_path
    fill_in "username", with: "Carl"
    fill_in "password_digest", with: "password"
    click_button "Create Account"
    assert page.has_content("Welcome, Rachel")
  end
end
