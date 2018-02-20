require "rails_helper"

describe "Create a Movie" do
  let(:attributes) {
    {
      title: SecureRandom.uuid,
      storyline: SecureRandom.uuid,
      release_date: 1.year.ago,
      genre: "Documentary",
      imdb_link: "https://imdb.com"
    }
  }
  it "creates the movie entry" do
    visit "/movies/new"
    fill_in("movie[title]", with: attributes[:title])
    fill_in("movie[storyline]", with: attributes[:storyline])
    fill_in("movie[string_release_date]", with: attributes[:release_date])
    fill_in("movie[genre]", with: attributes[:genre])
    fill_in("movie[imdb_link]", with: attributes[:imdb_link])
    click_button "Create Movie"
    expect(page).to have_content(attributes[:title])
  end
end
