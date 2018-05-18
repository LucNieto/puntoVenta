module Reports
  class ProductsController < ApplicationController
    before_action :authenticate_user!
    include ProductsHelper
    $foo = @product
    def index
    year = params[:y]
    month = params[:m]
    day = params[:d]
    sucursal_id = params[:s]
      if sucursal_id.empty?
        @product = Product.where(created_at: helper_filter_beginning(year,month,day,sucursal_id)...helper_filter_ending(year,month,day,sucursal_id))  
      else
        @product = Product.where(created_at: helper_filter_beginning(year,month,day,sucursal_id)...helper_filter_ending(year,month,day,sucursal_id),company_id:sucursal_id)
      end
      binding.pry
    end
    def reportd
      respond_to do |format|
        format.html
        format.csv {send_data foo.to_csv }    
        format.xls #{send_data @products.to_xls(col_sep:"\t") }   
    end

    end

    def new
      @product = RptProduct.new
    end
    
    def create
      @product = RptProduct.new params['/reports/products']
      redirect_to reports_products_path( y: params['/reports/products'][:year], 
                                          m: params['/reports/products'][:mes],
                                          d: params['/reports/products'][:dia],
                                          s: params['/reports/products'][:sucursal_id])
    end
  end
end
