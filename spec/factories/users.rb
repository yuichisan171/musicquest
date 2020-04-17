FactoryBot.define do
  factory :user do
    nickname              {"bobby"}
    email                 {"bobby@gmail.com"}
    password              {"000000"}
    password_confirmation {"000000"}
  end
end