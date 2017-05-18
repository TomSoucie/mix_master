require 'rails_helper'

=begin
As a user
Given that an artist exists in the database
When I visit that artist's show page
And I click on "Delete"
Then I should be back on the artist index page
Then I should not see the artist's name
=end

RSpec.feature "User deletes an artist" do
  scenario "they see the artist's page and delete" do
    artist = Artist.create(name: "Sturgill", image_path: "http://www.sturgillsimpson.com/sites/g/files/g2000005636/f/201604/about-pic-2.jpg")

    visit artist_path(artist)
    # byebug
    click_on "delete"

    expect(page).to have_content("All Artists")
    expect(page).to_not have_content(artist.image_path)
  end
end
