FactoryBot.define do
  factory :character do
    id { 1 }
    picture { 'ldsa4g564r8e8a654.jpg' }
    name { 'Max Goof' }
    age { 18 }
    weight { 56.69 }
    story { 'Son and only child of Goofy' }
    movie_id { 1 }
  end
end
