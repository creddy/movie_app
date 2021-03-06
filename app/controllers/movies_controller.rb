class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]

  def index
    @movies = MovieService.new.list(q: params[:q])
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params.permit(*movie_attributes).to_h)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: "Movie was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update_attributes(movie_params.permit(*movie_attributes).to_h)
        format.html { redirect_to @movie, notice: "Movie was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.fetch(:movie, {})
  end

  def movie_attributes
    %i[title storyline genre string_release_date imdb_link]
  end
end
