module Reports
  class ProductsController < ApplicationController
    before_action :authenticate_user!
    def index
    end

    def new
      @product = RptProduct.new
    end
    
    def create
      @product = RptProduct.new params['/reports/products']
      redirect_to reports_products_path( y: params['/reports/products'][:year], m: params['/reports/products'][:mes] )
    end
  end
end
