class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :username
      t.string :fullname
      t.string :password
      t.string :auth_secret
      t.datetime :last_seen

      t.timestamps null: false
    end
  end
end
