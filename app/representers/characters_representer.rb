# frozen_string_literal: true

class CharactersRepresenter
  def initialize(characters)
    @characters = characters
  end

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
