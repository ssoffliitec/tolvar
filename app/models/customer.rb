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

    has_many :sales
    
    validates :name, presence: true, :length => { :minimum => 3}
    validates :dni, :length => { :maximum => 9}, uniqueness: true
    validates :address, :length => { :maximum => 100 }
    validates :mobile, :length => { :maximum => 10 }
    validates :phone, :length => { :maximum => 10 }
    validates :mail, :length => { :maximum => 100 }
end
