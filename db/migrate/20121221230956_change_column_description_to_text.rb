class ChangeColumnDescriptionToText < ActiveRecord::Migration
  def up
  	change_column :sandwiches, :description, :text
  end

  def down
  end
end
