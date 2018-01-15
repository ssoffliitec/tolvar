class CreateBudgets < ActiveRecord::Migration[5.1]
  def change
    create_table :budgets do |t|
      t.integer :number
      t.date :date
      t.integer :state
      t.integer :customer_id

      t.timestamps
    end
  end
end
