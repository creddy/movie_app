require "rails_helper"

describe MoviesController, type: :controller do
  let(:valid_attributes) {
    {
      title: SecureRandom.uuid,
      storyline: SecureRandom.uuid,
      release_date: 1.year.ago,
      genre: "Documentary",
      imdb_link: "https://imdb.com"
    }
  }

  let(:invalid_attributes) {
    {
      title: nil,
      storyline: SecureRandom.uuid,
      release_date: 1.year.ago
    }
  }

  describe "GET #index" do
    let!(:movie) { Movie.create!(valid_attributes) }

    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    let!(:movie) { Movie.create!(valid_attributes) }

    it "returns a success response" do
      get :show, params: { id: movie.to_param }
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    let!(:movie) { Movie.create!(valid_attributes) }

    it "returns a success response" do
      get :edit, params: { id: movie.to_param }
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Movie" do
        expect {
          post :create, params: { movie: valid_attributes }
        }.to change(Movie, :count).by(1)
      end

      it "redirects to the created movie" do
        post :create, params: { movie: valid_attributes }
        expect(response).to redirect_to(Movie.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { movie: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    let!(:movie) { Movie.create!(valid_attributes) }

    context "with valid params" do
      let(:genre) { "Science Fiction" }
      let(:new_attributes) {
        {
          genre: genre
        }
      }

      it "updates the requested movie" do
        expect { put :update, params: { id: movie.to_param, movie: new_attributes } }
          .to change { movie.reload.genre }.to(genre)
      end

      it "redirects to the movie" do
        put :update, params: { id: movie.to_param, movie: valid_attributes }
        expect(response).to redirect_to(movie)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: { id: movie.to_param, movie: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:movie) { Movie.create!(valid_attributes) }

    it "destroys the requested movie" do
      expect {
        delete :destroy, params: { id: movie.to_param }
      }.to change(Movie, :count).by(-1)
    end

    it "redirects to the movies list" do
      delete :destroy, params: { id: movie.to_param }
      expect(response).to redirect_to(movies_url)
    end
  end
end
