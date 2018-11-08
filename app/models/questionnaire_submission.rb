class QuestionnaireSubmission < ApplicationRecord
  include DigestKey

  belongs_to :patient
  belongs_to :questionnaire
  has_many :answers

  def submitted?
    status == 'submitted'
  end

  def pending?
    status == 'pending'
  end

  # send out the link to patient
  def send_out!
    content = "Hi #{patient.name}, please complete the form today: #{link}. Thanks! -#{questionnaire.company.name}"
    if patient.phone.present?
      SmsSender.send(to: patient.user.phone, content: content)
    end
    if patient.email.present?
      UserMailer.send_questionnaire(self).deliver
    end
  end

  def link
    BitlySender.shorten("http://patient.checkup.vip/q/#{digest_key}")
  end

  # patient submits the questionnaire!
  def submit!(params)
    return false if params[:answers].blank?

    # Hard delete for now
    if self.answers.present?
      last_id = self.answers.last.id
    else
      last_id = nil
    end

    # Build new answers
    params[:answers].each do |answer|
      self.answers << Answer.new(answer.merge(questionnaire_submission_id: id))
    end
    self.status = 'submitted'

    if save
      self.answers.where("id <= ?", last_id).destroy_all if last_id
    end
    self
  end
end
