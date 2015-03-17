class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :subject_id

      t.timestamps null: false
    end
    add_index :questions, [:subject_id]
  end
end
