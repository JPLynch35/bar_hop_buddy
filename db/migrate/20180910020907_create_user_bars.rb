class CreateUserBars < ActiveRecord::Migration[5.1]
  def change
    create_table :user_bars do |t|
      t.references :user, foreign_key: true
      t.references :bar, foreign_key: true

      t.timestamps
    end
  end
end
