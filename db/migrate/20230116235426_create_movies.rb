class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :picture
      t.string :title
      t.datetime :release_date
      t.integer :raiting
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
