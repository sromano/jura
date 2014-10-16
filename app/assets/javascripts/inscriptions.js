$(function() {
  $( "#inscription_formula_id" ).change(function () {
    $( ".formula-block" ).hide();

    $( "#inscription_formula_id option:selected" ).each(function() {
      var formula_id = $(this).attr("value");
      $( "#formula-"+formula_id ).show();
    });
  }).change();
 });
});
