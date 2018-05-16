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

  # def sale_charge
  #   # binding.pry
  #   customer = Conekta::Customer.create({
  #     :name => 'Fulanito Pérez',
  #     :email => 'utColon18@gmail.com',
  #     :phone => '7441057042',
  #     :payment_sources => [{
  #       :type => 'card',
  #       :token_id => 'tok_test_visa_4242'
  #     }]
  #   })

  #   order = Conekta::Order.create({
  #     :currency => "MXN",
  #     :customer_info => {
  #       :customer_id => customer.id
  #     },
  #     :line_items => [{
  #       :name => "Box of Cohiba S1s",
  #       :unit_price => 35000,
  #       :quantity => 1
  #     }],
  #     :charges => [{
  #       :payment_method => {
  #         :type => "default"
  #       }
  #     }]
  #   })
  # end

  def edit
  end

  private
    def set_sale
      @sale = Sale.find params[:id]
    end
end
