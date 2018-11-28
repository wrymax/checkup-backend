class UserMailer < ApplicationMailer
  def send_questionnaire(submission)
    @link = submission.link
    @patient = submission.patient
    @company = submission.questionnaire.company

    if @patient.user.email
      mail to: @patient.user.email, subject: "Health questionnaire from #{@company.name}"
    end
  end

  # send questionnaire report to team
  def questionnaire_report(questionnaires)
    @report = []
    questionnaires.each do |q|
      @report.push q.report
    end

    mail to: ['Max Wang <rmw252@cornell.edu>', 'Apurva Desai <ard68@cornell.edu>', 'Ryan Hall <rrh76@cornell.edu>', 'Halyna Vasylevska <hv85@cornell.edu>'], subject: "[Checkup] Questionnaire Report"
  end
end
