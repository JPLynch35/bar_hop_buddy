class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :email
      t.string :token
      t.string :last_location
      t.string :last_long
      t.string :last_lat

      t.timestamps
    end
  end
end
