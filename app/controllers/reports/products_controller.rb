module Reports
  class ProductsController < ApplicationController
    before_action :authenticate_user!
   
    def index
      
    year = params[:y]
    month = params[:m]
    day = params[:d]
    sucursal_id = params[:s]
     #binding.pry

     #Filtro por año
      if month.empty? & day.empty? & sucursal_id.empty?
          month="01"
          year=(year).to_i
          month=(month).to_i
          beginning_of_year=Date.new(year,month,01).beginning_of_year
          end_of_year=beginning_of_year.end_of_year
          @product = Product.where(created_at: beginning_of_year...end_of_year)

      #Filtro por año y mes
      elsif day.empty? & !month.empty? & sucursal_id.empty?
          year=(year).to_i
          month=(month).to_i
          beginning_of_month=Date.new(year,month,01).beginning_of_month
          end_of_month=beginning_of_month.end_of_month
          @product = Product.where(created_at: beginning_of_month...end_of_month)

      #En caso de que se filtre por año y dia lo cual es incorrecto, regresarse a la vista new   
      elsif  !day.empty? & month.empty?
          @product = redirect_to  new_reports_product_path
          
      #Filtro por Año, mes, dia y sucursal
      elsif !day.empty? & !month.empty? & !sucursal_id.empty?
        year=(year).to_i
        month=(month).to_i
        day=(day).to_i
        sucursal_id=(sucursal_id).to_i
        beginning_of_day=Date.new(year,month,day).beginning_of_day
        end_of_day=beginning_of_day.end_of_day
        @product = Product.where(created_at: beginning_of_day...end_of_day,company_id:sucursal_id)
   
      #Filtro por Año, mes y sucursal  
      elsif day.empty? & !month.empty? & !sucursal_id.empty?
        year=(year).to_i
        month=(month).to_i
        day=(day).to_i
        sucursal_id=(sucursal_id).to_i
        beginning_of_month=Date.new(year,month,01).beginning_of_month
        end_of_month=beginning_of_month.end_of_month
        @product = Product.where(created_at: beginning_of_month...end_of_month,company_id:sucursal_id)

      #Filtro por año, mes y dia
      else
        year=(year).to_i
        month=(month).to_i
        day=(day).to_i
        beginning_of_day=Date.new(year,month,day).beginning_of_day
        end_of_day=beginning_of_day.end_of_day
        @product = Product.where(created_at: beginning_of_day...end_of_day)

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
