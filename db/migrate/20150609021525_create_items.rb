class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :question
      t.string :option_1
      t.string :option_2
      t.string :option_3
      t.string :option_4
      t.string :option_5
      t.integer :correct_option
      t.integer :item_number
      t.belongs_to :exam, index: true

      t.timestamps null: false
    end
  end
end
