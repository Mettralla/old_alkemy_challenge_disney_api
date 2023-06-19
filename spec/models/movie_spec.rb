require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it 'movie with valid data should be valid' do
      genre = create(:genre)
      expect(build(:movie, genre_id: genre.id)).to be_valid
    end

    it 'movie without picture should be invalid' do
      genre = create(:genre)
      expect(
        build(
          :movie,
          picture: '',
          title: 'Movie 1',
          release_date: '2022-01-01',
          raiting: 2,
          genre_id: genre.id
        )
      ).to be_invalid
    end

    it 'movie without title should be invalid' do
      genre = create(:genre)
      expect(
        build(
          :movie,
          picture: 'movie_1',
          title: '',
          release_date: '2022-01-01',
          raiting: 2,
          genre_id: genre.id
        )
      ).to be_invalid
    end

    it 'movie should have at least 2 letters' do
      genre = create(:genre)
      expect(
        build(
          :movie,
          picture: 'movie_1',
          title: 'e',
          release_date: '2022-01-01',
          raiting: 2,
          genre_id: genre.id
        )
      ).to be_invalid

      expect(
        build(
          :movie,
          picture: 'movie_1',
          title: 'ET',
          release_date: '2022-01-01',
          raiting: 2,
          genre_id: genre.id
        )
      ).to be_valid
    end

    it 'movie without release date should be invalid' do
      genre = create(:genre)
      expect(
        build(
          :movie,
          picture: 'movie_1',
          title: 'Movie 1',
          release_date: '',
          raiting: 2,
          genre_id: genre.id
        )
      ).to be_invalid
    end

    it 'movie without raiting should be invalid' do
      genre = create(:genre)
      expect(
        build(
          :movie,
          picture: 'movie_1',
          title: 'Movie 1',
          release_date: '2022-01-01',
          raiting: '',
          genre_id: genre.id
        )
      ).to be_invalid
    end

    it 'movie with raitings greater than 10 and lower than 1 should be invalid' do
      genre = create(:genre)
      expect(
        build(
          :movie,
          picture: 'movie_1',
          title: 'Movie 1',
          release_date: '2022-01-01',
          raiting: 0,
          genre_id: genre.id
        )
      ).to be_invalid

      expect(
        build(
          :movie,
          picture: 'movie_1',
          title: 'Movie 1',
          release_date: '2022-01-01',
          raiting: 11,
          genre_id: genre.id
        )
      ).to be_invalid
    end

    it 'movie without genre should be invalid' do
      expect(
        build(
          :movie,
          picture: 'movie_1',
          title: 'Movie 1',
          release_date: '2022-01-01',
          raiting: '8',
          genre_id: ''
        )
      ).to be_invalid
    end
  end

  describe 'associations' do
    it 'destroys associated characters when movie is destroyed' do
      genre = create(:genre)
      movie = create(:movie, genre_id: genre.id)
      create(:character, id: 50, picture: 'pj.jpg', name: 'P.J.', age: 18, weight: 85, story: "Max's best friend", movie_id: movie.id)
      create(:character, id: 51, picture: 'max.jpg', name: 'max', age: 18, weight: 60, story: "Protagonist", movie_id: movie.id)

      expect {
        movie.destroy
      }.to change { Character.count }.from(2).to(0)
    end
  end
end
