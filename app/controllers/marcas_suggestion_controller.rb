class MarcasSuggestionController < ApplicationController
  def index
    #require 'pry'; binding.pry
    if params[:query].present?
     query = params[:query]
     condition = "unaccent(lower(name)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
     @marcas = Marca.where(condition)
    end
    @marcas ||= Marca.none

    render json: @marcas
  end
end