class CambiandoTipoDato < ActiveRecord::Migration[5.1]
  def up
  	change_table :customers do |t|
  		t.change :mobile, :string
  		t.change :phone, :string
  		t.change :dni, :string
  	end
  end
  def down
  	change_table :customers do |t|
  		t.change :mobile, :integer
  		t.change :phone, :integer
  		t.change :dni, :integer
  	end
  end
end
