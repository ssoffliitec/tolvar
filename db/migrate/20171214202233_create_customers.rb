class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :adrress
      t.integer :dni
      t.integer :phone
      t.integer :mobile
      t.string :mail

      t.timestamps
    end
  end
end
