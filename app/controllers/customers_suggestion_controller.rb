class CustomersSuggestionController < ApplicationController
  def index
    #require 'pry'; binding.pry
    if params[:query].present?
     query = params[:query]
     condition = "dni LIKE '%#{I18n.transliterate(query.downcase)}%'"
     @customers = Customer.where(condition)
    end
    @customers ||= Customer.none

    render json: @customers
  end
end