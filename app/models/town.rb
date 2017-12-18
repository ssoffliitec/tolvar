# == Schema Information
#
# Table name: towns
#
#  id         :integer          not null, primary key
#  name       :string
#  code       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Town < ApplicationRecord
	include ActiveModel::Validations
	
	validates :name, presence: true, :length => { :minimum => 3}
	validates :code, presence: true, uniqueness: true
end
