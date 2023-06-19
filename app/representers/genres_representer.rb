# frozen_string_literal: true

# GenresRepresenter is responsible for representing a collection of Genre objects as JSON.
class GenresRepresenter
  # Initializes a new instance of GenresRepresenter.
  def initialize(genres)
    @genres = genres
  end

  # Converts the collection of Genre objects to a JSON representation.
  def as_json
    genres.map do |genre|
      {
        name: genre.name,
        picture: genre.picture
      }
    end
  end

  private

  attr_reader :genres
end
