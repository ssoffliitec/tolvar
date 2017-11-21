class CreateRecordatorios < ActiveRecord::Migration[5.1]
  def change
    create_table :recordatorios do |t|
      t.string :name
      t.string :texto

      t.timestamps
    end
  end
end
