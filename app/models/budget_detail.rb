# == Schema Information
#
# Table name: budget_details
#
#  id         :integer          not null, primary key
#  budget_id  :integer
#  number     :integer
#  item_id    :integer
#  qty        :integer
#  price      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BudgetDetail < ApplicationRecord
    belongs_to :budget
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
