FactoryBot.define do
  factory :question do
    title { "MyString" }
    question_type { "MyString" }
    options { "" }
    questionnaire_id { 1 }
  end
end
