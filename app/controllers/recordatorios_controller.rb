class RecordatoriosController < ApplicationController
  before_action :set_recordatorio, only: [:show, :edit, :update, :destroy]
  PAGE_SIZE=10
  # GET /recordatorios
  # GET /recordatorios.json
  def index
   @page = (params[:page] || 0).to_i
    @keywords = params[:keywords]

    search = Search.new(@page, PAGE_SIZE, @keywords)
    @recordatorios, @number_of_pages = search.recordatorios_by_name
  end

  # GET /recordatorios/1
  # GET /recordatorios/1.json
  def show
  end

  # GET /recordatorios/new
  def new
    @recordatorio = Recordatorio.new
  end

  # GET /recordatorios/1/edit
  def edit
  end

  # POST /recordatorios
  # POST /recordatorios.json
  def create
    @recordatorio = Recordatorio.new(recordatorio_params)

    respond_to do |format|
      if @recordatorio.save
        format.html { redirect_to recordatorios_path, notice: 'Recordatorio Creado.' }
        format.json { render :show, status: :created, location: @recordatorio }
      else
        format.html { render :new }
        format.json { render json: @recordatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recordatorios/1
  # PATCH/PUT /recordatorios/1.json
  def update
    respond_to do |format|
      if @recordatorio.update(recordatorio_params)
        format.html { redirect_to recordatorios_path, notice: 'Recordatorio Actualizado.' }
        format.json { render :show, status: :ok, location: @recordatorio }
      else
        format.html { render :edit }
        format.json { render json: @recordatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recordatorios/1
  # DELETE /recordatorios/1.json
  def destroy
    @recordatorio.destroy
    respond_to do |format|
      format.html { redirect_to recordatorios_url, alert: 'Recordatorio Eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recordatorio
      @recordatorio = Recordatorio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recordatorio_params
      params.require(:recordatorio).permit(:name, :texto)
    end
end
