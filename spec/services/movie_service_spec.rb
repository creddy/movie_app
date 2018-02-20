require "rails_helper"

describe MovieService do
  describe "#list" do
    let!(:first_movie) { Movie.create!(title: "a Movie") }
    let!(:second_movie) { Movie.create!(title: "A Second movie") }
    let(:results) { subject.list.to_a }

    describe "sorting" do
      it "returns a list of movies sorted by title" do
        expect(results.index(first_movie)).to be < results.index(second_movie)
      end
    end

    describe "searching" do
      let(:term) { second_movie.title[1..5] }
      let(:results) { subject.list(q: term) }

      it "returns results that contain the search term" do
        expect(results).to eq([second_movie])
      end

      context "when searching with a different case" do
        let(:term) { first_movie.title.upcase }

        it "returns the result" do
          expect(results).to eq([first_movie])
        end
      end
    end
  end
end
