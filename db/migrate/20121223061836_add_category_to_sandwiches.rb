class AddCategoryToSandwiches < ActiveRecord::Migration
  def change
    add_column :sandwiches, :category, :string
  end
end
