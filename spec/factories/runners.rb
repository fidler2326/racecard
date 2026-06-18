FactoryBot.define do
  factory :runner do
    name { "MyString" }
    number { "MyString" }
    trainer { "MyString" }
    jockey { "MyString" }
    program_number { "MyString" }
    race_id { 1 }
    card_id { 1 }
    finish_positon { 1 }
    scratched { false }
    finished { false }
    odds { "9.99" }
  end
end
