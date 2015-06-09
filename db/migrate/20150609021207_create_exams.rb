class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :title
      t.date :expires_on
      t.integer :time_limit
      t.integer :item_quantity
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
