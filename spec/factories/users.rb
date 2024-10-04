FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    
    nickname {Faker::Internet.username}
    email    {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name           {person.last.kanji}
    last_name_furigana  {person.last.katakana}
    first_name          {person.first.kanji}
    first_name_furigana {person.first.katakana}
    birthday {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end