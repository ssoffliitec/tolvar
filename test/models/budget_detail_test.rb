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

require 'test_helper'

class BudgetDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
