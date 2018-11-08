class CreateQuestionnaires < ActiveRecord::Migration[5.1]
  def change
    create_table :questionnaires do |t|
      t.integer :company_id
      t.integer :staff_id
      t.string :frequency

      t.timestamps
    end

    add_index :questionnaires, :company_id
    add_index :questionnaires, :staff_id
  end
end
