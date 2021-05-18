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
      expect(page).to have_css('.html_instructions')
    end
  end
end

=begin
  From the forms location response,
  take the address of the origin point
  return the closest fuel station 

  Request to NREL - Return nearest fuel station| lat long? address? 

  response of NREL = destination of our directions
  response of the form = origin of our directions

  Google Directions API | headers? body? 

=end