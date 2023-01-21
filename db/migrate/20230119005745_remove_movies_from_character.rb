class RemoveMoviesFromCharacter < ActiveRecord::Migration[7.0]
  def change
    remove_reference :characters, :movies, null: false, foreign_key: true
  end
end
