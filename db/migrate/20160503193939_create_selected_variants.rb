class CreateSelectedVariants < ActiveRecord::Migration
  def change
    create_table :selected_variants do |t|
      t.belongs_to :attempt, index: true, foreign_key: true
      t.belongs_to :question, index: true, foreign_key: true
      t.belongs_to :variant, index: true, foreign_key: true
      t.belongs_to :compare, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
