require 'rails_helper'
=begin
As a user
Given that an artist exists in the database
When I visit that artist's show page
And I click on "Edit"
And I fill in a new name
And I click on "Update Artist"
Then I should see the artist's updated name
Then I should see the existing image
=end
RSpec.feature "User edits an artist" do
  scenario "they see the artist's page and can edit fields" do
    new_name = "Simpson"
    artist = Artist.create(name: "Sturgill", image_path: "http://www.sturgillsimpson.com/sites/g/files/g2000005636/f/201604/about-pic-2.jpg")

    visit artist_path(artist)
    click_on "Edit Artist"
    expect(page).to have_content(artist.name)
    fill_in "Name", with: new_name
    click_on "Update Artist"

    expect(page).to have_content("Simpson")
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end
end
