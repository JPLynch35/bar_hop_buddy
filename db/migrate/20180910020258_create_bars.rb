class CreateBars < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'citext'
    create_table :bars do |t|
      t.citext :name
      t.citext :address
      t.string "longitude"
      t.string "latitude"
      t.json :open, default: {}
      t.json :close, default: {}
      t.json :hh_start, default: {}
      t.json :hh_end, default: {}
      t.text :message
      t.json :deals, default: {}
      t.citext :owner_email

      t.timestamps
    end
  end
end
