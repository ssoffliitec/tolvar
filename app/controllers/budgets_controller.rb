class BudgetsController < ApplicationController
  before_action :set_budget, only: [:create, :show, :edit, :update, :destroy]
  before_action :set_combo_values, only: [:new, :edit]

  PAGE_SIZE = 10

  # GET /budgets
  # GET /budgets.json
  def index
    # clear no saved budgets:
    unsaved_budgets = Budget.where(state: "draft")
    unsaved_budgets.each do |budget|
      budget.destroy
    end

    @page = (params[:page] || 0).to_i
    @keywords = params[:keywords]

    search = Search.new(@page, PAGE_SIZE, @keywords)
    @budgets, @number_of_pages = search.budgets
  end

  # GET /budgets/1
  # GET /budgets/1.json
  def show
  end

  # GET /budgets/new
  def new
    last_budget = Budget.where(state: "confirmed").maximum('number')
    number =  (last_budget != nil) ? last_budget + 1 : 1
    @budget = Budget.create(date: Date::current, number: number, state: "draft")
    @budget.budget_details.build
    params[:budget_id] = @budget.id.to_s
  end

  # GET /budgets/1/edit
  def edit
  end

  # POST /budgets
  # POST /budgets.json
  def create
  end

  # PATCH/PUT /budgets/1
  # PATCH/PUT /budgets/1.json
  def update
    @budget.confirmed!
    respond_to do |format|
      if @budget.update(budget_params)
        format.html { redirect_to budgets_url, notice: 'Presupuesto Guardado Correctamente.' }
        format.json { render :show, status: :ok, location: @budget }
      else
        format.html { render :edit }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1
  # DELETE /budgets/1.json
  def destroy
    @budget.destroy
    respond_to do |format|
      format.html { redirect_to budgets_url, alert: 'Presupuesto Eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    def set_combo_values
      @customers = Customer.all.order(:dni)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_budget
      @budget = Budget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def budget_params
      params.require(:budget).permit(:number, :date, :customer_id, sale_details_attributes: [:id, :budget_id, :item_id, :number, :qty, :price, :_destroy] )
    end
end
