class Movie
  include Dynamoid::Document

  field :title
  field :storyline
  field :release_date, :date
  field :genre
  field :imdb_link

  validates :title, presence: true
end
