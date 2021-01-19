FactoryBot.define do
  factory :comment do
    book
    description { "MyString" }
    first_name { "MyString" }
    score { 1 }
  end
end
