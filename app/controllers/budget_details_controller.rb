class BudgetDetailsController < ApplicationController
  before_action :set_budget, only: [:new, :create, :destroy]	

	def new
		@budget_details = @budget.budget_details.build
		@budget_details.item = Item.first
	end

	def create
		item_exists = false
		item_id = params[:budget_details][:item_id].to_i
		@budget.budget_details.each do |detail|
			if detail.item_id == item_id
				# Ya existe el item en la factura, agregar cantidad
				item_exists = true
				@budget_detail = detail
				@saved_budget_detail = detail.id
				break
			end
		end
		if item_exists
			@budget_detail.qty += params[:budget_details][:qty].to_i
			@budget_detail.price = params[:budget_details][:price].to_f
			@budget_detail.save!
		else
			budget_detail = BudgetDetail.new(budget_details_params)
			if @budget.budget_details.last.nil?
				budget_detail.number = 1
			else
				budget_detail.number = @budget.budget_details.last.number + 1
			end
			@budget.budget_details << budget_detail
		end
		item_stock = Item.find(item_id)
    @budget.save!
		
	end

	def edit
		@budget_detail = BudgetDetail.find(params[:id])
	end

	def update
	end

	def destroy
		@budget_detail = BudgetDetail.find(params[:id])
		@budget_detail.destroy

		respond_to do |format|
			format.js { render layout: false }
		end
	end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget
      @budget = Budget.find(params[:budget_id].to_i)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def budget_details_params
      params.require(:budget_details).permit(:id, :budget_id, :item_id, :item_description, :number, :qty, :price, :_destroy)
    end
end
