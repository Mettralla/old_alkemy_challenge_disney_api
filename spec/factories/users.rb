FactoryBot.define do
  factory :user do
    email { "one@one.org" }
    password_digest { BCrypt::Password.create("good_pa$$") }
  end
end
