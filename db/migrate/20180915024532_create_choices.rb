class CreateChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :choices do |t|
      t.boolean :click
      t.references :user
      t.references :bar

      t.timestamps
    end
  end
end
