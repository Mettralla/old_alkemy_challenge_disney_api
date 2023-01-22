class CharacterRepresenter
  def initialize(character)
    @character = character
  end

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
