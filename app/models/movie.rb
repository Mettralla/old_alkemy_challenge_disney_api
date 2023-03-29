class Movie < ApplicationRecord
  belongs_to :genre
  has_many :characters, dependent: :destroy
end
