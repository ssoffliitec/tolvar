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
#

class Item < ApplicationRecord
 belongs_to :marca
 belongs_to :unit
 belongs_to :category

 validates :description, presence: true

 def item_description
  self.description + ( (self.marca != nil) ? ' - ' + self.marca.name : '' )
 end

 def marca_name
  if self.marca
   self.marca.name
  else
   ''
  end
 end
end
