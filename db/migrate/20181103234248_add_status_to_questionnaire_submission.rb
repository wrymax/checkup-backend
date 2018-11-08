class AddStatusToQuestionnaireSubmission < ActiveRecord::Migration[5.1]
  def change
    add_column :questionnaire_submissions, :status, :string, default: 'pending'
  end
end
