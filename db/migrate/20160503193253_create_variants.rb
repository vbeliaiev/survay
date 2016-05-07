class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.string :title
      t.boolean :correct, default: false
      t.belongs_to :question, index: true, foreign_key: true
      t.belongs_to :compare, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
