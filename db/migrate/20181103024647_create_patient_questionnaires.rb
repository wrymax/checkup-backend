class CreatePatientQuestionnaires < ActiveRecord::Migration[5.1]
  def change
    create_table :patient_questionnaires do |t|
      t.integer :patient_id
      t.integer :questionnaire_id

      t.timestamps
    end

    add_index :patient_questionnaires, :patient_id
    add_index :patient_questionnaires, :questionnaire_id
  end
end
