class SalesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  end

  def show
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
