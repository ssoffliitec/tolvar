class AgregarColumna < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :abierto, :string
    add_column :items, :cerrado, :string
    add_column :items, :carrera, :string
    add_column :items, :superior, :string
    add_column :items, :inferior, :string
    add_column :items, :modelo, :string
    add_column :items, :anio, :string
    add_column :items, :pos, :string
  end
end
