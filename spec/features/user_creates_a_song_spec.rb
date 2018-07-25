require 'rails_helper'

=begin
As a user
Given that artists exist in the database
When I visit the artist songs index
And I click "New song"
And I fill in the title
And I click "Create Song"
Then I should see the song name
And I should see a link to the song artist's individual page
=end

RSpec.feature "User submits a new song" do
  scenario "they see the page for the individual song" do
    artist = create(:artist)

    visit artist_path(artist)

    click_on "New song"
    fill_in "song_title", with: "Sea Stories"
    click_on "Create Song"

    expect(page).to have_content("Sea Stories")
    expect(page).to have_link artist.name, href: artist_path(artist)
  end
end
