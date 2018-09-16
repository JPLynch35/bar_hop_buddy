class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'citext'
    create_table :users do |t|
      t.string :uid
      t.citext :email
      t.string :last_location
      t.string :last_long
      t.string :last_lat

      t.timestamps
    end
  end
end
