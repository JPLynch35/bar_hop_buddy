class CreateBars < ActiveRecord::Migration[5.1]
  def change
    create_table :bars do |t|
      t.string :name
      t.string :address
      t.text :open
      t.text :close
      t.text :hh_start
      t.text :hh_end
      t.text :message
      t.text :deals
      t.string :id_key

      t.timestamps
    end
  end
end
