class SaleDetail < ApplicationRecord
	belongs_to :sale
	belongs_to :item

	validates :item_id, presence: true
	validates :qty, presence: true
	validates :price, presence: true

	accepts_nested_attributes_for :item


	def subtotal
		self.qty ? qty * unit_price : 0
	end

	def unit_price
		if persisted?
			price
		else
			item ? item.price : 0
		end
	end
end