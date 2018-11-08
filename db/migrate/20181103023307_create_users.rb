class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :phone
      t.string :password_digest
      t.string :auth_token
      t.string :profile_type
      t.integer :profile_id

      t.timestamps
    end

    add_index :users, :phone
    add_index :users, :auth_token
    add_index :users, [:profile_id, :profile_type]
  end
end
