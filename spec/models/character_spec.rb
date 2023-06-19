require 'rails_helper'

RSpec.describe Character, type: :model do
  before(:each) do
    @genre = create(:genre)
    @movie = create(:movie, genre_id: @genre.id)
  end

  describe 'validations' do
    it 'character with valid data should be valid' do
      expect(
        build(:character, id: 50, picture: 'pj.jpg', name: 'P.J.', age: 18, weight: 85, story: "Max's best friend", movie_id: @movie.id)
      ).to be_valid
    end

    it 'character without picture should be invalid' do
      expect(
        build(:character, id: 50, picture: '', name: 'P.J.', age: 18, weight: 85, story: "Max's best friend", movie_id: @movie.id)
      ).to be_invalid
    end

    it 'character without name should be invalid' do
      expect(
        build(:character, id: 50, picture: 'pj.jpg', name: '', age: 18, weight: 85, story: "Max's best friend", movie_id: @movie.id)
      ).to be_invalid
    end

    it 'character should have at least 3 letters' do
      expect(
        build(:character, id: 50, picture: 'pj.jpg', name: 'pj', age: 18, weight: 85, story: "Max's best friend", movie_id: @movie.id)
      ).to be_invalid

      expect(
        build(:character, id: 51, picture: 'pj.jpg', name: 'p.j', age: 18, weight: 85, story: "Max's best friend", movie_id: @movie.id)
      ).to be_valid
    end

    it 'character with taken name should be invalid' do
      create(:character, movie_id: @movie.id)
      expect(
        build(:character, id: 50, picture: 'max.jpg', name: 'Max Goof', age: 18, weight: 85, story: "Max's best friend", movie_id: @movie.id)
      ).to be_invalid
    end

    it 'character without age should be invalid' do
      expect(
        build(:character, id: 50, picture: 'pj.jpg', name: 'p.j', age: '', weight: 85, story: "Max's best friend", movie_id: @movie.id)
      ).to be_invalid
    end

    it 'character with age lower than 1 or float should be invalid' do
      expect(
        build(:character, id: 50, picture: 'pj.jpg', name: 'p.j', age: 0, weight: 85, story: "Max's best friend", movie_id: @movie.id)
      ).to be_invalid

      expect(
        build(:character, id: 50, picture: 'pj.jpg', name: 'p.j', age: 1.2, weight: 85, story: "Max's best friend", movie_id: @movie.id)
      ).to be_invalid
    end

    it 'character without weight should be invalid' do
      expect(
        build(:character, id: 50, picture: 'pj.jpg', name: 'p.j', age: 18, weight: '', story: "Max's best friend", movie_id: @movie.id)
      ).to be_invalid
    end

    it 'character with weight lower than 1 should be invalid' do
      expect(
        build(:character, id: 50, picture: 'pj.jpg', name: 'p.j', age: 18, weight: 0, story: "Max's best friend", movie_id: @movie.id)
      ).to be_invalid
    end

    it 'character without story should be invalid' do
      expect(
        build(:character, id: 50, picture: 'pj.jpg', name: 'p.j', age: 18, weight: 70, story: '', movie_id: @movie.id)
      ).to be_invalid
    end

    it 'character without movie should be invalid' do
      expect(
        build(:character, id: 50, picture: 'pj.jpg', name: 'p.j', age: 18, weight: 70, story: "Max's best friend", movie_id: '')
      ).to be_invalid
    end
  end

  describe 'associations' do
    it 'character should belong to movie' do
      character = create(:character, movie_id: @movie.id)
      expect(character.movie).to eq(@movie)
    end
  end
end
