FactoryBot.define do
  factory :movie do
    id { 1 }
    picture { '1f5d6a7f8a4f654dsa.jpg' }
    title { 'An Extremely Goofy Movie' }
    release_date { '29/02/2000' }
    raiting { 4 }
    genre_id { 1 }
  end
end
