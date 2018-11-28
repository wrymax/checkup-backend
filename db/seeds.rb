require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
# then, whenever you need to clean the DB
puts "clean database..."
DatabaseCleaner.clean

# Create seed data
puts "create team..."
teams_data = [
  {
    name: 'team 1' 
  }, 
  {
    name: 'team 2' 
  }, 
  {
    name: 'team 3' 
  }, 
  {
    name: 'team 4' 
  }
]
teams_data.each do |t|
  Team.create t
end

puts "create company..."
company = Company.create(name: 'Pfizer', description: "A pharmaceutical company")
users_data = [
  { 
    first_name: 'Ryan', 
    last_name: 'Hall', 
    phone: '+18887770001', 
    type: 'Staff', 
    password: '123456'
  }, 
  { 
    first_name: 'Max', 
    last_name: 'Wang', 
    phone: '+18482566459', 
    email: 'max@workstream.is', 
    type: 'Patient', 
    password: '123456', 
    age: 30, 
    team_id: 1
  }, 
  { 
    first_name: 'Apurva', 
    last_name: 'Desai', 
    phone: '+18887770003', 
    type: 'Patient', 
    password: '123456', 
    age: 26, 
    team_id: 1
  }, 
  { 
    first_name: 'Halyna', 
    last_name: 'Vasylevska', 
    phone: '+18887770004', 
    type: 'Patient', 
    password: '123456', 
    age: 26, 
    team_id: 2
  } 
]

puts "create users..."
users_data.each do |u|
  user = User.create(phone: u[:phone], password: u[:password], email: u[:email])
  _params = {first_name: u[:first_name], last_name: u[:last_name]}
  if u[:type] == 'Staff'
    _params.merge!(company_id: company.id)
  elsif u[:type] == 'Patient'
    _params.merge!(age: u[:age], team_id: u[:team_id])
  end

  user.create_profile(u[:type], _params)
end

puts "create questionnaire..."
questionnaire = Staff.first.questionnaires.create({
  company_id: Staff.first.company_id, 
  frequency: '1m'
})

puts "bind patients and questionnaire..."
questionnaire.patients << Patient.first
questions_data = [
  {
    title: 'Please describe your pain today...', 
    question_type: 'multiple_choice', 
    options: ['good', 'medium', 'bad']
  }, 
  {
    title: 'Did you take insulin today?', 
    question_type: 'boolean', 
    options: ['yes', 'no']
  }, 
  {
    title: 'How many hours did you sleep last night?', 
    question_type: 'scale', 
    options: (1..12).to_a.map{|h| "#{h} Hours"}
  }
]
puts "create questions..."
questions_data.each do |q|
  questionnaire.questions.create(q)
end
