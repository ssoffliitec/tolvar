# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  code        :string
#  description :string
#  marca_id    :integer
#  unit_id     :integer
#  category_id :integer
#  stock       :integer
#  min_stock   :integer
#  price       :decimal(8, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  sale_stock  :integer
#  picture     :string
#

class Item < ApplicationRecord

 include ActiveModel::Validations
  
 mount_uploader :picture, PictureUploader
 belongs_to :marca
 belongs_to :unit
 belongs_to :category

 validates :description, presence: true
 validates :marca_id, presence: true
 validates :unit_id, presence: true
 validates :category_id, presence: true
 validates :stock, presence: true, numericality: { only_integer: true }
 validates :sale_stock, presence: true, numericality: { only_integer: true }
 validates :min_stock, presence: true, numericality: { only_integer: true }
 validates :price, numericality: true
 validates :code, uniqueness: true

 
 def marca_name
  if self.marca
   self.marca.name
  else
   ''
  end
 end
end
