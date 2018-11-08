class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :questionnaire_submission_id
      t.string :value

      t.timestamps
    end

    add_index :answers, :questionnaire_submission_id
    add_index :answers, :question_id
  end
end
