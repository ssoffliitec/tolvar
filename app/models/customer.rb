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

    validates :name, presence: true, :length => { :minimum => 3}
    validates :dni, :length => { :maximum => 9, too_long: "%{count} Caracteres como máximo" }, :uniqueness => { :case_sensitive => false}
    validates :address, :length => { :maximum => 100 , too_long: "%{count} Caracteres como máximo" }
    validates :mobile, :length => { :maximum => 10 , too_long: "%{count} Caracteres como máximo" }
    validates :phone, :length => { :maximum => 10 , too_long: "%{count} Caracteres como máximo" }
    validates :mail, :length => { :maximum => 100 , too_long: "%{count} Caracteres como máximo" }
end
