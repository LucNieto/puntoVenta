class SalesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  end

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

  def edit
  end

  private
    def set_sale
      @sale = Sale.find params[:id]
    end
end
