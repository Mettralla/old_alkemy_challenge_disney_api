# frozen_string_literal: true

# CharactersRepresenter is responsible for representing a collection of Character objects as JSON.
class CharactersRepresenter
  # Initializes a new instance of CharactersRepresenter.
  def initialize(characters)
    @characters = characters
  end

  # Converts the collection of Character objects to a JSON representation.
  def as_json
    characters.map do |character|
      {
        picture: character.picture,
        name: character.name
      }
    end
  end

  private

  attr_reader :characters
end
