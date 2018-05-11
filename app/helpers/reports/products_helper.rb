module Reports::ProductsHelper
    def helper_filter_beginning( year,month,day,sucursal )

        #filtrar por año
        if      !year.empty? & month.empty? & day.empty?
                year=(year).to_i
                return Date.new(year,01,01).beginning_of_year   

        #filtrar por año y mes  
        elsif   day.empty? & !month.empty?
                year=(year).to_i
                month=(month).to_i
                return Date.new(year,month,01).beginning_of_month  

        #filtro por año,mes  y dia
        elsif   !day.empty? & !month.empty? 
                year=(year).to_i
                month=(month).to_i
                day=(day).to_i
                return Date.new(year,month,day).beginning_of_day
        end
    end
    def helper_filter_ending( year,month,day,sucursal )

        #filtrar por año
        if      month.empty? & day.empty? 
                year=(year).to_i
                return Date.new(year,01,01).end_of_year  

        #filtrar por año y mes  
        elsif   day.empty? & !month.empty? 
                year=(year).to_i
                month=(month).to_i
                return Date.new(year,month,01).end_of_month  

        #filtro por año, mes  y dia
        elsif   !day.empty? & !month.empty? 
                year=(year).to_i
                month=(month).to_i
                day=(day).to_i
                return beginning_of_day=Date.new(year,month,day).end_of_day
        end
    end
end


