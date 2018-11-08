FactoryBot.define do
  factory :patient do
    first_name { "MyString" }
    last_name { "MyString" }
    user_id { 1 }
    age { 1 }
  end
end
