class Movie
  include Dynamoid::Document

  field :title
  field :storyline
  field :release_date, :date
  field :genre
  field :imdb_link

  validates :title, presence: true

  validate :release_date_format

  def string_release_date=(date)
    self[:string_release_date] = date
  end

  def string_release_date
    self[:string_release_date]
  end

  private

  def release_date_format
    return unless self[:string_release_date].present?
    errors.add(:release_date, "invalid") unless store_release_date
  end

  def store_release_date
    self.release_date = Date.parse(self[:string_release_date])
  rescue ArgumentError
    false
  end
end
