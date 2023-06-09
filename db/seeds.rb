# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

genres = [
  { name: 'Action', picture: 'action.jpg' },
  { name: 'Adventure', picture: 'adventure.jpg' },
  { name: 'Comedy', picture: 'comedy.jpg' },
  { name: 'Drama', picture: 'drama.jpg' },
  { name: 'Horror', picture: 'horror.jpg' },
  { name: 'Animation', picture: 'animation.jpg' },
  { name: 'Family', picture: 'family.jpg' }
]

genres.each do |genre|
  Genre.create(genre)
end

disney_movies = [
  { title: 'The Lion King', release_date: Date.new(1994, 6, 15), raiting: 8, genre_id: 2, picture: 'the_lion_king.jpg' },
  { title: 'Aladdin', release_date: Date.new(1992, 11, 25), raiting: 8, genre_id: 1, picture: 'aladdin.jpg' },
  { title: 'Frozen', release_date: Date.new(2013, 11, 27), raiting: 8, genre_id: 2, picture: 'frozen.jpg' },
  { title: 'Toy Story', release_date: Date.new(1995, 11, 22), raiting: 8, genre_id: 6, picture: 'toy_story.jpg' },
  { title: 'Finding Nemo', release_date: Date.new(2003, 5, 20), raiting: 8, genre_id: 2, picture: 'nemo.jpg' },
  { title: 'Coco', release_date: Date.new(2017, 10, 20), raiting: 8, genre_id: 2, picture: 'coco.jpg' }
]

disney_movies.each do |movie_data|
  Movie.create(movie_data)
end

Character.create(
  picture: 'simba.jpg',
  name: 'simba',
  age: 2,
  weight: 50,
  story: 'Simba is the main protagonist of The Lion King',
  movie_id: 1
)

Character.create(
  picture: 'aladdin_ch.jpg',
  name: 'Aladdin',
  age: 18,
  weight: 70,
  story: 'Aladdin is a street urchin who becomes a prince with the help of a magical genie',
  movie_id: 2
)
