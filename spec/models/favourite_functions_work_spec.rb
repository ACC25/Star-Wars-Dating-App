require "rails_helper"

RSpec.describe "favourite model works" do
  it "returns love_connection properly" do
    home = Planet.create!(name: "Home",
                          climate: "temperate",
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
                              api_url: "the")
    person1 = Peoples.create!(name: "Jarleena",
                              height: 345,
                              skin_colour: "Brown",
                              eye_colour: "red",
                              gender: "female",
                              planet_id: Planet.find_by(name: "Home").id,
                              race_id: Race.find_by(name: "JarJars").id,
                              api_url: "the")
    person2 = Peoples.create!(name: "Jarpeena Jar",
                              height: 345,
                              skin_colour: "Brown",
                              eye_colour: "red",
                              gender: "female",
                              planet_id: Planet.find_by(name: "Home").id,
                              race_id: Race.find_by(name: "JarJars").id,
                              api_url: "the")
    result = Favourite.love_connection("female", "sentient", "Random", "Anything")
    person = Peoples.find_by(name: "Jar Jar Binks")
    expect(result).to eq(person.id)
    google = Favourite.find_image("Jar Jar Binks")
    expect(google).to eq("https://vignette2.wikia.nocookie.net/starwars/images/d/d2/Jar_Jar_aotc.jpg/revision/latest?cb=20080303052132")
    wiki = Favourite.find_wiki_links(person.name)
    expect(wiki).to eq("https://en.wikipedia.org/wiki/Jar_Jar_Binks")
  end
end
