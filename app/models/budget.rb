# == Schema Information
#
# Table name: budgets
#
#  id          :integer          not null, primary key
#  number      :integer
#  date        :date
#  state       :integer
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Budget < ApplicationRecord
    has_many :budget_details, inverse_of: :budget, dependent: :destroy
	has_many :items, through: :budget_details
	belongs_to :customer

	validates :number, presence: true
	validates :date, presence: true

	accepts_nested_attributes_for :budget_details, reject_if: :budget_detail_rejectable?,
									allow_destroy: true

	enum state: [:draft, :confirmed]

	def total
		details = self.budget_details

		total = 0.0
		details.flat_map do |d|
			total += d.qty * d.price
		end
		total
	end

	private

    def budget_detail_rejectable?(att)
        att[:item_id].blank? || att[:qty].blank? || att[:price].blank? || att[:qty].to_f <= 0 || att[:price].to_f <= 0
    end
end
