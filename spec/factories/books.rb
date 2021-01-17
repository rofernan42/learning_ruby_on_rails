FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    description { Faker::Lorem.paragraph }
    author { Faker::Book.author }
    pages_count { rand(100..500) }
    published_at { Faker::Date.between(from: 20.years.ago, to: Date.yesterday) }
  end
end
