$(document).ready(function() {
  $(document).on('change keyup', '.input_cantidad, .input_importe', function(){
    method.recalculate();
  });

  method = {
    recalculate: function(){
      neto = 0;
      var $row = $(".nested-fields").children();
      // obtenemos todas las filas(cada que se presiona Agregar detalle se agrega un row con N elementos)
      var cantidad = 0, importe = 0, saldo = 0;
      $.each($row.children(), function(index, group){
        $elements = $( group ).children().children();
        // Obtenemos información de cada elemento
        $.each( $elements, function(index, element){
          $this = $( element );
          if( $this.hasClass('input_cantidad') ){
            cantidad = parseFloat( $this.val() );
          }else if( $this.hasClass('input_importe') ){
            importe = parseFloat( $this.val() );
          }else if( $this.hasClass('col-form-label') ){
            saldo = (cantidad * importe ).toFixed(2);
            $this.html( saldo );
            neto += parseFloat(saldo);
          }
        }); 
      });
      
      $("#sale_neto").val( neto.toFixed(2) );
      $("#sale_neto_iva").val( (neto * 0.16).toFixed(2) );
      $("#sale_total_compra").val( (neto * 1.16).toFixed(2) );
    }
  }
  
});
