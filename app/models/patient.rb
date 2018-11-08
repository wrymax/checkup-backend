class Patient < ApplicationRecord
  belongs_to :user
  has_many :patient_questionnaires
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
end
