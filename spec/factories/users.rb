FactoryBot.define do
  factory :user do
    email { "one@one.org" }
    password_digest { "good_pa$$" }
  end
end
