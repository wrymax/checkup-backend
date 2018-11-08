namespace :questionnaire do
  task :send_questionnaire => :environment do
    Questionnaire.find_each do |q|
      q.send_out!
    end
  end
end
