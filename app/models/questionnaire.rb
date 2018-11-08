class Questionnaire < ApplicationRecord
  belongs_to :staff
  belongs_to :company
  has_many :questions
  has_many :patient_questionnaires
  has_many :patients, through: :patient_questionnaires
  has_many :questionnaire_submissions

  # parse frequency into Rails Time object
  FrequencyMap = {
    d: 'days', 
    h: 'hours', 
    m: 'minutes', 
    s: 'seconds'
  }
  def parse_frequency
    if frequency.present?
      ret = frequency.match(/(\d+(\.{0,1}\d*))(\w+)/).to_a
      unit = ret[3]
      span = ret[1]
      return span.to_f.send(FrequencyMap[unit.to_sym])
    else
      nil
    end
  end
  
  # send questionnaire to registered patients
  def send_out!
    if last_sent_at.blank? || Time.now - last_sent_at >= parse_frequency
      patients.each do |p|
        questionnaire_submission = self.questionnaire_submissions.create(
          patient: p
        )
        questionnaire_submission.send_out!
      end
      update(last_sent_at: Time.now)
    end
  end
end
