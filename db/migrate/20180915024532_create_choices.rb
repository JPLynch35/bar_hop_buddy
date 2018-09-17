class CreateChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :choices do |t|
      t.boolean :click
      t.references :user, foreign_key: true
      t.references :bar, foreign_key: true

      t.timestamps
    end
  end
end
