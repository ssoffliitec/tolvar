class ValidateSuggestedCustomerController < ApplicationController
 def index
  customer = []
  if params[:customer_dni].present?
   customer_dni = params[:customer_dni]
   condition = "unaccent(lower(dni)) = '#{I18n.transliterate(customer_dni.downcase)}'"
   customer = Customer.where(condition)
  end
  if !customer.empty?
   result = [valid: true, id: customer.ids]
  else
   result = [valid: false, id: 0]
  end
  render json: result
 end
end