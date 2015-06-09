class CreateItemAnswers < ActiveRecord::Migration
  def change
    create_table :item_answers do |t|
      t.integer :option_number
      t.integer :user_answer
      t.boolean :correct
      t.belongs_to :solved_exam, index: true

      t.timestamps null: false
    end
  end
end
