class ChangeColumnNameCategories < ActiveRecord::Migration[6.1]
  def change
  	rename_column :categories, :name, :name
  end
end
