require 'rails_helper'

=begin
As a user
Given that artists exist in the database
When I visit the artists index
Then I should see each artist's name
And each name should link to that artist's individual page
=end

RSpec.feature "User views all artists" do
  scenario "they see the names of each artist" do
    artist_1 = Artist.create(name: "Sturgill", image_path: "https://upload.wikimedia.org/wikipedia/commons")
    artist_2 = Artist.create(name: "Bob", image_path: "https://upload.wikimedia.org/wikipedia/commons")

    visit artists_path

    expect(page).to have_link "Sturgill", href: artist_path(artist_1)
    expect(page).to have_link "Bob", href: artist_path(artist_2)

  end
end
