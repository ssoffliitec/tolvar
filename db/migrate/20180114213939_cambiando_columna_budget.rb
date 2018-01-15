class CambiandoColumnaBudget < ActiveRecord::Migration[5.1]
  def change
    rename_column :budget_details, :sale_id, :budget_id
  end
end
