# frozen_string_literal: true

class GenreRepresenter
  def initialize(genre)
    @genre = genre
  end

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