require 'rails_helper'


feature "user can search for house members" do

  scenario "user submits valid state name" do
    # As a user
    # When I visit "/"
    visit '/'

    select "Colorado", from: :state
    # And I select "Colorado" from the dropdown
    click_on "Locate Members of the House"
    # And I click on "Locate Members from the House"
    expect(current_path).to eq(search_path)
    # Then my path should be "/search" with "state=CO" in the parameters
    expect(page).to have_content("7 Results")
    # And I should see a message "7 Results"
    expect(page).to have_css(".member", count: 7)
    # And I should see a list of 7 the members of the house for Colorado

    within(first(".member")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".role")
      expect(page).to have_css(".party")
      expect(page).to have_css(".district")
    end
    # And they should be ordered by seniority from most to least
    # And I should see a name, role, party, and district for each member

  end
end



















# require 'rails_helper'
#
# feature "user can search by state" do
#   scenario "user can see basic page view" do
#     visit '/'
#
#     expect(page).to have_content("HouseSalad")
#
#     select('Colorado', :from => "state")
#     click_on "Locate Members of the House"
#
#     expect(current_path).to eq("/search")
#
#     within(".house-members") do
#       expect(page).to have_css("li.name")
#       expect(page).to have_css("li.role")
#       expect(page).to have_css("li.party")
#       expect(page).to have_css("li.district")
#     end
#
#     expect(page).to have_css(".house-members", count: 7)
#   end
# end

# As a user
# When I visit "/"
# And I select "Colorado" from the dropdown
# And I click on "Locate Members from the House"
# Then my path should be "/search" with "state=CO" in the parameters
# And I should see a message "7 Results"
# And I should see a list of 7 the members of the house for Colorado
# And they should be ordered by seniority from most to least
# And I should see a name, role, party, and district for each member
