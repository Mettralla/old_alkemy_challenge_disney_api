class AddMovieToCharacter < ActiveRecord::Migration[7.0]
  def change
    add_reference :characters, :movie, null: false, foreign_key: true
  end
end
