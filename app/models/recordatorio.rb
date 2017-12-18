# == Schema Information
#
# Table name: recordatorios
#
#  id         :integer          not null, primary key
#  name       :string
#  texto      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Recordatorio < ApplicationRecord
	include ActiveModel::Validations
	
	validates :name, presence: true, :length => { :minimum => 3}
end
