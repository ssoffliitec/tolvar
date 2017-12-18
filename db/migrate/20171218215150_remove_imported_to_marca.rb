class RemoveImportedToMarca < ActiveRecord::Migration[5.1]
  def change
    remove_column :marcas, :imported, :boolean
  end
end
