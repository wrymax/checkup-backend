class CreateQuestionnaireSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :questionnaire_submissions do |t|
      t.integer :patient_id
      t.integer :questionnaire_id
      t.string :digest_key

      t.timestamps
    end

    add_index :questionnaire_submissions, :patient_id
    add_index :questionnaire_submissions, :questionnaire_id
    add_index :questionnaire_submissions, :digest_key
  end
end
