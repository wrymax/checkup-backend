class UserMailer < ApplicationMailer
  def send_questionnaire(submission)
    @link = submission.link
    @patient = submission.patient
    @company = submission.questionnaire.company

    if @patient.user.email
      mail to: @patient.user.email, subject: "Health questionnaire from #{@company.name}"
    end
  end
end
