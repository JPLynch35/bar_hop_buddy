class CreateUserBars < ActiveRecord::Migration[5.1]
  def change
    create_table :user_bars do |t|
      t.references :user
      t.references :bar

      t.timestamps
    end
  end
end
