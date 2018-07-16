class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.string :text
      t.boolean :correct
      t.integer :question_id

      t.timestamps
    end
  end
end
