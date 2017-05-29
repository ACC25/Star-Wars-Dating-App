require 'rails_helper'

RSpec.describe "user can navigate to match page" do
  it "can talk to the api" do
    user = User.create!(username: "Carl", password: "password")
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"
    assert page.has_content?("Carl")

    click_link "search"
  end

  it "can view links to past searches" do
  home = Planet.create!(name: "Home",
                        climate: "Frozen",
                        terrain: "bumpy",
                        api_url: "the")
  race = Race.create!(name: "JarJars",
                      classification: "mammal",
                      designation: "sentient",
                      api_url: "the")
  jarjar = Peoples.create!(name: "Jar Jar Binks",
                            height: 345,
                            skin_colour: "Brown",
                            eye_colour: "red",
                            gender: "male",
                            planet_id: Planet.find_by(name: "Home").id,
                            race_id: Race.find_by(name: "JarJars").id,
                            api_url: "the"
                          )
  visit new_user_path
  fill_in "Username", with: "Carlsss"
  fill_in "Password", with: "password"
  click_button "Create Account"

  click_link "search"
  check "male"
  find(:css, "#Random").set(true)
  check "Human"
  find(:css, "#Anything").set(true)
  click_button "Submit"

  assert page.has_content?("RESULTS")
  assert page.has_content?("PAST RESULTS")
  assert page.has_content?("Home")
  assert page.has_content?("SKIP")

  click_link "CONTROL PANEL"
  click_link "stats"
  expect(path).to eq("/dashboards/i")
  end
end
