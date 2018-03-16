class BussinesNamesController < ApplicationController
  before_action :set_bussines_name, only: [:show, :edit, :update, :destroy]

  # GET /bussines_names
  # GET /bussines_names.json
  def index
    @bussines_names = BussinesName.all
  end

  # GET /bussines_names/1
  # GET /bussines_names/1.json
  def show
  end

  # GET /bussines_names/new
  def new
    @bussines_name = BussinesName.new
  end

  # GET /bussines_names/1/edit
  def edit
  end

  # POST /bussines_names
  # POST /bussines_names.json
  def create
    @bussines_name = BussinesName.new(bussines_name_params)

    respond_to do |format|
      if @bussines_name.save
        format.html { redirect_to @bussines_name, notice: 'Bussines name was successfully created.' }
        format.json { render :show, status: :created, location: @bussines_name }
      else
        format.html { render :new }
        format.json { render json: @bussines_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bussines_names/1
  # PATCH/PUT /bussines_names/1.json
  def update
    respond_to do |format|
      if @bussines_name.update(bussines_name_params)
        format.html { redirect_to @bussines_name, notice: 'Bussines name was successfully updated.' }
        format.json { render :show, status: :ok, location: @bussines_name }
      else
        format.html { render :edit }
        format.json { render json: @bussines_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bussines_names/1
  # DELETE /bussines_names/1.json
  def destroy
    @bussines_name.destroy
    respond_to do |format|
      format.html { redirect_to bussines_names_url, notice: 'Bussines name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bussines_name
      @bussines_name = BussinesName.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bussines_name_params
      params.require(:bussines_name).permit(:nombre, :rfc, :direccion_fiscal)
    end
end
