FactoryBot.define do
  factory :user do
    phone { "MyString" }
    password_digest { "MyString" }
    auth_token { "MyString" }
    profile_type { "MyString" }
    profile_id { 1 }
  end
end
