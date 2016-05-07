class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.belongs_to :quiz, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
