class CreateSolvedExams < ActiveRecord::Migration
  def change
    create_table :solved_exams do |t|
      t.boolean :finished
      t.integer :score
      t.integer :correct_answers
      t.belongs_to :user, index: true
      t.belongs_to :exam, index: true

      t.timestamps null: false
    end
  end
end
