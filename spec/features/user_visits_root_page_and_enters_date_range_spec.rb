require 'rails_helper'

# As a guest user
feature "As a guest user" do
  context "they visit the root page and enter dates and click 'Determine Most Dangerous Day'" do
    scenario "it displays the most dangerous day and 3 asteroids" do
      visit '/'
      fill_in :start_date, with: "2018-01-01"
      fill_in :end_date, with: "2018-01-07"
      click_on "Determine Most Dangerous Day"

      expect(current_path).to eq('/most_dangerous_day')
      expect(page).to have_content("Most Dangerous Day")
      expect(page).to have_content("January 1, 2018 - January 7, 2018")
      expect(page).to have_content("Most dangerous day in range: January 1, 2018")
    end
  end
end

# When I visit "/"
# And I enter "2018-01-01" into the start date
# And I enter "2018-01-07" into the end date
# And I click "Determine Most Dangerous Day"
#
# Then I should be on "/most_dangerous_day"
# And I should see a heading for "Most Dangerous Day"
# And I should see "January 1, 2018 - January 7, 2018"
# And I should see a heading for the most dangerous day in that range "January 1, 2018"
# And I should see 3 asteroids in that list
#
# And I should see "Name: (2014 KT76)"
# And I should see "NEO Reference ID: 3672906"
#
# And I should see "Name: (2001 LD)"
# And I should see "NEO Reference ID: 3078262"
#
# And I should see "Name: (2017 YR1)"
# And I should see "NEO Reference ID: 3794979"
