class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content
      t.integer :question_id
      t.boolean :correct, default: false

      t.timestamps null: false
    end
    add_index :answers, [:question_id]
  end
end
