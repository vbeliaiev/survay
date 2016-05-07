class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :title
      t.text :description
      t.integer :status

      t.timestamps null: false
    end
  end
end
