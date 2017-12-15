class CambiandoColumna < ActiveRecord::Migration[5.1]
  def change
  	rename_column :customers, :adrress, :address
  end
end
