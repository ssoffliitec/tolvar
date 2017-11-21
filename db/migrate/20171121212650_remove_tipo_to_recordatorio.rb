class RemoveTipoToRecordatorio < ActiveRecord::Migration[5.1]
  def change
    remove_column :recordatorios, :tipo, :boolean
  end
end
