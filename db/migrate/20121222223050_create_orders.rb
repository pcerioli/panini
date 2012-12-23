class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.integer :sandwich_id
      t.string :client_name
      t.text :variation

      t.timestamps
    end
  end
end
