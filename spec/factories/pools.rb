FactoryBot.define do
  factory :pool do
    pool_code { "MyString" }
    odds { "9.99" }
    currency { "MyString" }
    tote { "MyString" }
    card_id { 1 }
    status { "MyString" }
    first_race_number { 1 }
    total { "9.99" }
  end
end
