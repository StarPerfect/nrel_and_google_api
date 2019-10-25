# The NREL alternate fuel stations nearest station API: https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/nearest/
# The Google Directions API: https://developers.google.com/maps/documentation/directions/start
# We will be searching for the nearest electric charging station to Turing.

#
# I should also see:
# - the distance of the nearest station
# - the travel time from Turing to that fuel station (should be 0.1 miles)
# - The HTML direction instructions to get to that fuel station
#   "Head <b>southeast</b> on <b>17th St</b> toward <b>Larimer St</b>"

require 'rails_helper'

describe 'Fuel Station Search Endpoint' do
  it 'can visit main path and enter details to search for the nearest station from Turing' do
    visit '/'

    expect(current_path).to eq(root_path)

    select 'Turing'
    click_button 'Find Nearest Station'

    expect(current_path).to eq(search_path)
    within('.NREL') do
      expect(page).to have_content('Seventeenth Street Plaza')
      expect(page).to have_content('1225 17th St.')
      expect(page).to have_content('Denver')
      expect(page).to have_content('CO')
      expect(page).to have_content('80202')
      expect(page).to have_content('ELEC')
      expect(page).to have_content('Not Specified')
    end

    within('.Google') do
      expect(page).to have_content('Distance: 0.1 mi')
      expect(page).to have_content('Travel Duration: 1 min')
      expect(page).to have_content('Travel Duration: 1 min')
      expect(page).to have_css('.html_instructions')
    end
  end
end
