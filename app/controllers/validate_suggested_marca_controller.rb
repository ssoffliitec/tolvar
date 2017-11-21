class ValidateSuggestedMarcaController < ApplicationController
 def index
  marca = []
  if params[:marca_name].present?
   marca_name = params[:marca_name]
   condition = "unaccent(lower(name)) = '#{I18n.transliterate(marca_name.downcase)}'"
   marca = Marca.where(condition)
  end
  if !marca.empty?
   result = [valid: true, id: marca.ids]
  else
   result = [valid: false, id: 0]
  end
  render json: result
 end
end