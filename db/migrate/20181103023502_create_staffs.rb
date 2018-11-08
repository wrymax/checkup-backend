class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.string :first_name
      t.string :last_name
      t.integer :company_id
      t.integer :user_id

      t.timestamps
    end

    add_index :staffs, :company_id
    add_index :staffs, :user_id
  end
end
