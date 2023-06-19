# frozen_string_literal: true

# GenreRepresenter is responsible for representing a Genre object as JSON.
class GenreRepresenter
  # Initializes a new instance of GenreRepresenter.
  def initialize(genre)
    @genre = genre
  end

  # Converts the Genre object to a JSON hash representation.
  def as_json
    {
      id: @genre.id,
      name: @genre.name,
      picture: @genre.picture
    }
  end

  private

  attr_reader :genres
end
