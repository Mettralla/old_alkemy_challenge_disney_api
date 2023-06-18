class Genre < ApplicationRecord
  validates :name, uniqueness: true, presence: true, length: { minimum: 3 }
  validates :picture, presence: true

  has_many :movies, dependent: :destroy
end
