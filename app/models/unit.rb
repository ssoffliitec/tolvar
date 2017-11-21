class Unit < ApplicationRecord
	include ActiveModel::Validations

	validates :name, presence: true

	validates_with ValidateUnaccent, model: self
end