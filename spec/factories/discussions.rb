FactoryBot.define do
  factory :discussion do
    content { "MyText" }
    user { nil }
    comment { nil }
    discussion { nil }
  end
end
