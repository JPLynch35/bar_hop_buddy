class CreateBars < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'citext'
    create_table :bars do |t|
      t.citext :name
      t.citext :address
      t.string "longitude"
      t.string "latitude"
      t.text :open
      t.text :close
      t.text :hh_start
      t.text :hh_end
      t.text :message
      t.text :deals
      t.citext :owner_email

      t.timestamps
    end
  end
end
