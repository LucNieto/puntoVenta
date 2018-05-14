class ChargesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_charge, only: [:new, :charge]
  
  def new
  end

  def charge
    begin
      customer = Conekta::Customer.create({
        :name => params[:card_name],
        :email => 'utColon18@gmail.com',
        :phone => '7441057042',
        :payment_sources => [{
          :type => 'card',
          :token_id => 'tok_test_visa_4242'
        }]
      })

      line_items = []

      @sale.details.each do |item|
        line_items.push({
            name: item.product.nombre,
            unit_price: (item.product.precio_venta * 100).to_i,
            quantity: item.cantidad
          })
      end

      @order = Conekta::Order.create({
        :currency => "MXN",
        :customer_info => {
          :customer_id => customer.id
        },
        :line_items => line_items,
        :charges => [{
          :payment_method => {
            :type => "default"
          }
        }]
      })

    rescue Conekta::ProcessingError => e
      puts e.message #la tarjeta no pudo ser procesada
    rescue Conekta::Error => e
      puts e.message
    end
  end

  private
    def set_charge
      @sale = Sale.find params[:sale_id]
    end

end
