class Reports::ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @product = RptProduct.new
  end
  def create
    @product = RptProduct.new params['/reports/balances']
    redirect_to reports_products_path( y: params['/reports/balances'][:year], m: params['/reports/balances'][:mes] )
  end
end
