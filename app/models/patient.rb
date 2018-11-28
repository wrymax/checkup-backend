class Patient < ApplicationRecord
  belongs_to :user
  belongs_to :team
  has_many :patient_questionnaires
  has_many :questionnaire_submissions
  has_many :questionnaires, through: :patient_questionnaires

  def name
    "#{first_name} #{last_name}"
  end

  def email
    user&.email
  end

  def phone
    user&.phone
  end

  # add credit of a questionnaire
  def add_credits_of(questionnaire)
    update(credits: credits + questionnaire.credits)
  end
end
