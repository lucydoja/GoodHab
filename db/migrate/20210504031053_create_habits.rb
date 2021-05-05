class CreateHabits < ActiveRecord::Migration[6.1]
  def change
    create_table :habits do |t|
      t.date :date
      t.belongs_to :category, index: true, foreign_key: true
      t.integer :hours
      t.integer :minutes
      t.string :description

      t.timestamps
    end
  end
end
