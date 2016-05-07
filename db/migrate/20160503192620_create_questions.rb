class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :type
      t.belongs_to :quiz, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
