class Character < ApplicationRecord
  validates :picture, presence: true
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :weight, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :story, presence: true, length: { minimum: 3, maximum: 500 }
  validates :movie_id, presence: true

  has_many :movies
end
