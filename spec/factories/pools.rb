FactoryBot.define do
  factory :pool do
    pool_code { "WIN" }
    carryover { "1000.00" }
    currency { "GBP" }
    tote { "UKT" }
    card_id { 1 }
    status { "ACTIVE" }
    first_race_number { 1 }
    total { "13392.29" }

    trait :deletable do
      status { "SUSPENDED" }
      total { "0.00" }
    end
  end
end
