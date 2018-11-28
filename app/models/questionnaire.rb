class Questionnaire < ApplicationRecord
  belongs_to :staff
  belongs_to :company
  has_many :questions
  has_many :patient_questionnaires
  has_many :patients, through: :patient_questionnaires
  has_many :questionnaire_submissions

  accepts_nested_attributes_for :questions

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

  # report json data
  def report
    {
      company: company.name, 
      created_at: created_at.to_date, 
      last_sent_at: last_sent_at.to_date, 
      submissions: questionnaire_submissions.order(:id).map do |s|
        {
          patient: s.patient.name, 
          status: s.status, 
          sent_at: s.created_at.to_date, 
          answers: s.answers.map do |a|
            {
              question: a.question.title, 
              answer: a.answer_details
            }
          end
        }
      end
    }
  end
end
