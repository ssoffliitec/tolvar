class AddTipoToRecordatorio < ActiveRecord::Migration[5.1]
  def change
    add_column :recordatorios, :tipo, :boolean
  end
end
