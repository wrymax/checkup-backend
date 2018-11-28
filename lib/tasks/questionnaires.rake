namespace :questionnaire do
  task :send_questionnaire => :environment do
    Questionnaire.find_each do |q|
      q.send_out!
    end
  end

  desc "geenrate a quesionnaire report"
  task :report, [:ids] => :environment do |task, args|
    ids = args[:ids].split('-')
    if ids.present?
      @questionnaires = Questionnaire.where(id: ids)
      # !!!! comment this out because public repo cannot include Sendgrid info
      # UserMailer.questionnaire_report(@questionnaires).deliver
    end
  end
end
