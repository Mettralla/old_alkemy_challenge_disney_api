require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'validations' do
    it 'genre with valid data should be valid' do
      expect(build(:genre)).to be_valid
    end

    it 'genre with invalid data should be invalid' do
      expect(build(:genre, name: '', picture: '')).to be_invalid
    end

    it 'genre name should have at least 3 letters' do
      expect(build(:genre, name: 'su', picture: 'suspense.jpg')).to be_invalid

      expect(build(:genre, name: 'sus', picture: 'suspense.jpg')).to be_valid
    end

    it 'genre with taken name should be invalid' do
      create(:genre)

      expect(build(:genre, name: 'Comedy', picture: 'comedy.jpg')).to be_invalid
    end
  end

  describe 'associations' do
    it 'destroys associated movies when genre is destroyed' do
      genre = create(:genre, name: 'Comedy', picture: 'comedy.jpg')
      create(:movie, id: 50, picture: 'movie_1.jpg', title: 'Movie 1', release_date: '2022-01-01', raiting: 2, genre_id: genre.id)
      create(:movie, id: 51, picture: 'movie_2.jpg', title: 'Movie 2', release_date: '2022-01-01', raiting: 2, genre_id: genre.id)

      expect {
        genre.destroy
      }.to change { Movie.count }.from(2).to(0)
    end
  end
end
