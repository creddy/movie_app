class MovieService
  def list(q: nil)
    movies = q.present? ? Movie.where("title_lower.contains" => q.downcase) : Movie.all
    movies.sort_by(&:title_lower)
  end
end
