class ItemsSuggestionController < ApplicationController
	def index
		if params[:query].present?
			query = params[:query]
			condition1 = "unaccent(lower(items.description)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
			condition2 = condition1 + " OR unaccent(lower(items.code)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
			@items = Item.where(condition2)
		end
		@items ||= Item.none
		render json: @items
	end
end