class AddOrdersCountToSandwiches < ActiveRecord::Migration
  def change
    add_column :sandwiches, :orders_count, :integer, :null => false, :default => 0

  end
end
