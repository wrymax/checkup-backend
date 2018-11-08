FactoryBot.define do
  factory :questionnaire_submission do
    patient_id { 1 }
    questionnaire_id { 1 }
    digest_key { "MyString" }
  end
end
