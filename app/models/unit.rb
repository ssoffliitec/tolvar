# == Schema Information
#
# Table name: units
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Unit < ApplicationRecord
	include ActiveModel::Validations

	validates :name, presence: true, :length => { :minimum => 3}, uniqueness: true
	has_many :items
	
	validates_with ValidateUnaccent, model: self
end
