class CreateExaminations < ActiveRecord::Migration
  def change
    create_table :examinations do |t|
      t.integer :subject_id
      t.integer :number_correct
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :examinations, [:subject_id]
  end
end
