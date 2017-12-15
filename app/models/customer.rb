# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  dni        :string
#  phone      :string
#  mobile     :string
#  mail       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Customer < ApplicationRecord
    include ActiveModel::Validations

    validates :name, presence: true, :length => { :minimum => 3, too_short: ": Debe tener al menos %{count} caracteres" }
    validates :dni, :length => { :maximum => 9, too_long: "%{count} characters is the maximum allowed" }
    validates :address, :length => { :maximum => 100 }
    validates :mobile, :length => { :maximum => 10 }
    validates :phone, :length => { :maximum => 10 }
    validates :mail, :length => { :maximum => 100 }
end
