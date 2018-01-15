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

require 'test_helper'

class BudgetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
