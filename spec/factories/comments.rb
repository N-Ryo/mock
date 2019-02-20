FactoryBot.define do
  factory :comment do
    feeling { 1 }
    content { "MyString" }
    user { nil }
  end
end
