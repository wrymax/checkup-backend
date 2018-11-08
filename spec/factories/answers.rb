FactoryBot.define do
  factory :answer do
    question_id { 1 }
    questionnaire_submission_id { 1 }
    value { "MyString" }
  end
end
