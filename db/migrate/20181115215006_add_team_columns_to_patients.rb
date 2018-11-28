class AddTeamColumnsToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :questionnaires, :credits, :float, default: 1
    add_column :questionnaires, :points, :float, default: 100

    add_column :patients, :team_id, :integer
    add_column :patients, :credits, :float, default: 0
    add_index :patients, :team_id

    Patient.all.each do |p|
      c = p.questionnaire_submissions.where(status: 'submitted').map{|qs| qs.questionnaire.credits}.sum
      p.update(credits: c)
    end
  end
end
