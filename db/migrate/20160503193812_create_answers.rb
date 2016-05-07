class CreateAnswers < ActiveRecord::Migration
  def up
    create_table :answers do |t|
      t.belongs_to :question, index: true, foreign_key: true
      t.belongs_to :attempt, index: true, foreign_key: true
      t.boolean :correct

      t.timestamps null: false
    end
  end
end
