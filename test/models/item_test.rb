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

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
