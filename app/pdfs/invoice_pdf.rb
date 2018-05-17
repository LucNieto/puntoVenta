class InvoicePdf < Prawn::Document
  def initialize(invoice, view)
    super()
    @invoice = invoice
    @view = view
    logo
    #text "" #text es para texto linealsin manipulación, draw_text permite manejar parametros
    draw_text "Cliente: #{@invoice.user.nombres} #{@invoice.user.apellido_paterno } #{@invoice.user.apellido_materno}" , :at => [40, 500], size: 12
    sale_details
    move_down 100
    thanks_message
  end
#end


  def logo
    pad(15) {draw_text "Ticket No. #{@invoice.id}, Fecha: #{@invoice.created_at.strftime("%d/%m/%Y")}", :at => [160, 700], size: 15}
    stroke_horizontal_rule
    logopath =  "#{Rails.root}/app/assets/images/logo.png"
    image logopath, :width => 197, :height => 197
    bounding_box([43, 647], :width => 110, :height => 110) do
        stroke_bounds
    end
    draw_text "#{@invoice.company.bussines_name.nombre}" , :at => [160, 620], size: 22
    draw_text "#{@invoice.company.direccion}", :at => [160, 605], size: 12
    draw_text "Sucursal: #{@invoice.company.nombre}", :at => [160, 585], size: 12
    draw_text "RFC: #{@invoice.company.bussines_name.rfc}", :at => [160, 570], size: 12
    draw_text "Dirección Fiscal: #{@invoice.company.bussines_name.direccion_fiscal}", :at => [160, 555], size: 12
  end

  def thanks_message
    text "Hola #{@invoice.user.username.capitalize}, !#{@invoice.company.nombre} le agradece su compra¡.",:indent_paragraphs => 40, :size => 9
    text "Por favor conserve éste ticket para futuros reclamos.",:indent_paragraphs => 40, :size => 9
    
  end

  def sale_details
    move_down 40
    table subscription_item_rows, :width => 300, :position => 40 do
          row(0).font_style = :bold 
          columns(1).align = :right
          columns(2).align = :right
          self.header = true
          self.column_widths = {0 => 200, 1 => 100}
        end
    end

    #producto, cantidad, precio, importe
  # def subscription_item_rows
  #  # total_compra = 0 
  #     [["Producto", "Cantidad", "Precio", "Importe"]]+
  #     @invoice.details.each do |item|
  #         [item.product.nombre,
  #         item.cantidad ,
  #         item.product.precio_venta,
  #         item.importe ]
  #         #total_compra += item.importe
  #     end
    
  # end

    def subscription_item_rows
        ([["Descripción","Monto"], #+
         [ "Subtotal ",  "#{@invoice.neto} "],
         [ "IVA ",  "#{@invoice.neto_iva} "],
         [ "Total ",  "#{@invoice.total_compra} "]])
    end

end


