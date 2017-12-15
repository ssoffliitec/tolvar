class AddImportedToMarca < ActiveRecord::Migration[5.1]
  def change
    add_column :marcas, :imported, :boolean
  end
end
