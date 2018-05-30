 $(document).ready(function() {

  $(document).on("cocoon:after-remove", function() {
    method.recalculate();
  });
  
  $(document).on('change keyup', '.input_cantidad, .input_importe', function(){
    method.recalculate();
  });
  $(document).on('change onchange', '.select_product', function(){
    method.recalculate();
  });

   method = {
    recalculate: function(){
      neto = 0;
      var $row = $(".nested-fields").children();
      
      var cantidad = 0, saldo = 0,precio=0.00;
      $.each($row.children(), function(index, group){
        $elements = $( group ).children().children();
        $.each( $elements, function(index, element){
          $this = $( element );
          if( $this.hasClass('input_cantidad') ){
            cantidad = parseFloat( $this.val() );
          }else if( $this.hasClass('input_importe') ){
            saldo = (cantidad * precio ).toFixed(2);
            $this.val(saldo);
            neto += parseFloat(saldo);
          }else if( $this.hasClass('col-form-label') ){
            $this.html( precio );
          }else if( $this.hasClass('select_product') ){
             precio =  parseFloat($this.find(':selected').attr('data-precio'));
          }
          if($this.hasClass('delete')){
            saldo-importe;
          }
        }); 
      });
      $("#sale_neto").val( neto.toFixed(2) );
      $("#sale_neto_iva").val( (neto * 0.16).toFixed(2) );
      $("#sale_total_compra").val( (neto * 1.16).toFixed(2) );
    }
  }
});
