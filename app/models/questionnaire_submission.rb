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
    # content_1 = "Hi #{patient.name}, please complete the form today: #{link}. Thanks! -#{questionnaire.company.name}"
    content_2 = "#{patient.name}, help your team win! Earn 100 points by answering this survey: #{link}" # or "Team Cancer is pulling ahead. Answer this survey to help your team catch up: #{link}"
    if patient.phone.present?
      # SmsSender.send(to: patient.user.phone, content: content_1)
      # SmsSender.send(to: patient.user.phone, content: content_2)
    end
    if patient.email.present?
      # !!!! comment this out because public repo cannot include Sendgrid info
      # UserMailer.send_questionnaire(self).deliver
    end
  end

  def link
    BitlySender.shorten("http://patient.checkup.vip/q/#{digest_key}")
  end

  # patient submits the questionnaire!
  def submit!(params)
    return false if params[:answers].blank?
    return self if submitted?

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
    # !!! Temp comment out for demo
    # self.status = 'submitted'

    if save
      # delete old answers
      self.answers.where("id <= ?", last_id).destroy_all if last_id
      # patient gets credits
      patient.add_credits_of(questionnaire)
      # team gets points
      patient.team&.add_points_of(questionnaire)
    end
    self
  end
end
