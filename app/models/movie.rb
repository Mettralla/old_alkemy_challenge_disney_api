class Movie < ApplicationRecord
  validates :picture, presence: true
  validates :title, presence: true, length: { minimum: 2 }, uniqueness: true
  validates :release_date, presence: true
  validates :raiting, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates :genre_id, presence: true

  belongs_to :genre
  has_many :characters, dependent: :destroy
end
