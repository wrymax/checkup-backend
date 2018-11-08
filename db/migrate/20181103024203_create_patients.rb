class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :user_id
      t.integer :age

      t.timestamps
    end

    add_index :patients, :user_id
  end
end
