class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :question_type
      t.jsonb :options
      t.integer :questionnaire_id

      t.timestamps
    end

    add_index :questions, :questionnaire_id
  end
end
