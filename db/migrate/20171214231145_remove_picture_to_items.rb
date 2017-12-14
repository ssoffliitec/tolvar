class RemovePictureToItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :picture, :string
  end
end
