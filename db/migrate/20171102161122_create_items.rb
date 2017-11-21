class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :code
      t.string :description
      t.references :marca, foreign_key: true
      t.references :unit, foreign_key: true
      t.references :category, foreign_key: true
      t.integer :stock
      t.integer :min_stock
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
