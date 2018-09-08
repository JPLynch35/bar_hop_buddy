class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :email
      t.string :last_location
      t.string :token

      t.timestamps
    end
  end
end
