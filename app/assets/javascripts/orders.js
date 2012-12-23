$(function(){

 //Submit the form when you click on the modal button
 $("#btn-order").on("click", function(event){
 		$(this).addClass('disabled');
 		$(this).html("Saving...");
    $('#new_order').submit();
  });

});

