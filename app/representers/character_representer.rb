# frozen_string_literal: true

# CharacterRepresenter is responsible for representing a Character object as JSON.
class CharacterRepresenter
  # Initializes a new instance of CharacterRepresenter.
  def initialize(character)
    @character = character
  end

  # Converts the Character object to a JSON hash representation.
  def as_json
    {
      id: @character.id,
      picture: @character.picture,
      name: @character.name,
      age: @character.age,
      weight: @character.weight,
      story: @character.story,
      movies: @character.movie.title
    }
  end

  private

  attr_reader :characters
end
