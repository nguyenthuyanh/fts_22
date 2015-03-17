class CreateAnswerSheets < ActiveRecord::Migration
  def change
    create_table :answer_sheets do |t|
      t.integer :examination_id
      t.integer :question_id
      t.integer :answer_id
      t.boolean :correct

      t.timestamps null: false
    end
    add_index :answer_sheets, [:examination_id]
  end
end
