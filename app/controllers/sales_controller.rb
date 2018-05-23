class SalesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
  end


  def create
    @sale = Sale.new(sale_params)
    @sale.user = current_user
    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
  def show
    respond_to do |format|
      format.html
      format.pdf do
        #pdf = Prawn::Document.new
        #pdf.text ""
        pdf = InvoicePdf.new(@sale, view_context)
        send_data pdf.render,
         filename: 
        "Invoice_#{@sale.created_at.strftime("%d/%m/%Y")}_#{@sale.id}.pdf",
        type: "application/pdf", disposition: 'inline', info: 'info'
        info = {
          :Title => "Ticket",
          :Author => "#{current_user.email}",
          :Subject => "Detalle de la venta",
          :Keywords => "ticket venta",
          :Creator => "#{@sale.company.nombre}",
          :Producer => "Prawn",
          :CreationDate => Time.now
        }

      end
    end
  end

  
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_sale
      @sale = Sale.find params[:id]
    end

    def sale_params
      params.require(:sale).permit(:user_id, :company_id, :neto, :neto_iva, :total_compra, details_attributes: Detail.attribute_names.map(&:to_sym).push(:_destroy) )
    end

end
