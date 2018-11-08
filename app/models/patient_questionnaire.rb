class PatientQuestionnaire < ApplicationRecord
  belongs_to :patient
  belongs_to :questionnaire
end
