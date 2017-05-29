require "rails_helper"

RSpec.describe "admin core functionality works" do
  it "admin can be created" do
    user = User.create!(username: "Admin",
                        password: "boom",
                        role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_overview_index_path
    expect(page).to have_content("Admin Overview")


  end

  context "as default user" do
    it 'does not allow default user to see admin categories index' do
      user = User.create!(username: "fern@gully.com",
                         password: "password",
                         role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit admin_overview_index_path
      expect(page).to_not have_content("Admin Categories")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end

end
