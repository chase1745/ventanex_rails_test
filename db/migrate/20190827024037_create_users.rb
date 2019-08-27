class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :encrypted_password # Assuming just using simple auth, without a gem like devise

      t.timestamps
    end
  end
end
