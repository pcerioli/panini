class CreateSandwiches < ActiveRecord::Migration
  def change
    create_table :sandwiches do |t|
      t.string :name
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
