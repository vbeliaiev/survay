class CreateCompares < ActiveRecord::Migration
  def change
    create_table :compares do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
