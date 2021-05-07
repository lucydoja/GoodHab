class AddUserIdToHabits < ActiveRecord::Migration[6.1]
  def change
    add_column :habits, :user_id, :integer
    add_index :habits, :user_id
  end
end
