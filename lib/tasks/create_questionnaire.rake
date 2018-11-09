require 'yaml'

namespace :questionnaire do
  task :create_questionnaire => :environment do
    # assertions
    file_name = ARGV[-1]
    if ARGV.length != 2 || file_name[-5..-1] != ".yaml"
      raise "questionnaire input yaml file required"
    end
    # import and unpack data
    questionnaire_data = YAML.load_file(file_name).with_indifferent_access
    questionnaire_data = questionnaire_data.fetch(:questionnaire)
    # create company
    company = Company.create!(questionnaire_data[:company])
    # create staff
    staff_columns = Staff.column_names - %w[ id user_id created_at updated_at ]
    staff_user_data = questionnaire_data[:staff].except(*staff_columns)
    staff_data = questionnaire_data[:staff].slice(*staff_columns)
    staff_user = User.create!(staff_user_data)
    staff = Staff.create!(staff_data.merge(user: staff_user, company: company))
    # create users
    patient_columns = Patient.column_names - %w[ id user_id created_at updated_at ]
    user_data = questionnaire_data[:patients].map { |hsh| hsh.except(*patient_columns) }
    patient_data = questionnaire_data[:patients].map { |hsh| hsh.slice(*patient_columns) }
    users = User.create!(user_data)
    # create patients
    patient_data = patient_data.map.with_index { |hsh, idx| hsh.merge(user_id: users[idx].id) }
    patients = Patient.create!(patient_data)
    # create questionnaire
    questionnaire = Questionnaire.create!(
      questionnaire_data.slice(:frequency, :questions_attributes).merge(
        patients: patients,
        company: company,
        staff: staff
      )
    )
  end
end
