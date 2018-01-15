class SalesController < ApplicationController
  before_action :set_sale, only: [:create, :show, :edit, :update, :destroy]
  before_action :set_combo_values, only: [:new, :edit, :create, :update]

  PAGE_SIZE = 10

  # GET /sales
  # GET /sales.json
  def index
    # clear no saved sales:
    unsaved_sales = Sale.where(state: "draft")
    unsaved_sales.each do |sale|
      sale.destroy
    end

    @page = (params[:page] || 0).to_i
    @keywords = params[:keywords]

    search = Search.new(@page, PAGE_SIZE, @keywords)
    @sales, @number_of_pages = search.sales
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    last_sale = Sale.where(state: "confirmed").maximum('number')
    number =  (last_sale != nil) ? last_sale + 1 : 1
    @sale = Sale.create(date: Date::current, number: number, state: "draft")
    @sale.sale_details.build
    params[:sale_id] = @sale.id.to_s
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    @sale.confirmed!

    puts params[:item_stock]
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to sales_url, notice: 'Venta Guardada Correctamente.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, alert: 'Venta eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    def set_combo_values
      @customers = Customer.all.order(:dni)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:number, :date, :customer_id, sale_details_attributes: [:id, :sale_id, :item_id, :number, :qty, :price, :_destroy] )
    end
end
