require "rails_helper"

describe "Movie listing" do
  let!(:movie) { Movie.create!(title: "Hello World") }

  it "displays a list of all movies" do
    visit "/"
    expect(page).to have_content("MovieApp")
    within("table.movies") do
      expect(page).to have_content(movie.title)
    end
  end

  describe "Searching for a movie" do
    let!(:other_movie) { Movie.create!(title: "Not me") }

    it "displays a list containing the searched for movie" do
      visit "/"
      fill_in("q", with: movie.title)
      click_button "Search"
      within("table.movies") do
        expect(page).to have_content(movie.title)
        expect(page).not_to have_content(other_movie.title)
      end
    end
  end
end
