# frozen_string_literal: true

class GenresRepresenter
  def initialize(genres)
    @genres = genres
  end

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
