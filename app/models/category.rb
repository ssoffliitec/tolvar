# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
	include ActiveModel::Validations
	
	has_many :items
	validates :name, presence: true, :length => { :minimum => 3 }, uniqueness: true

	validates_with ValidateUnaccent, model: self
end