$(function(){

 //Submit the form when you click on the modal button
 $("#btn-order").on("click", function(event){
 		$(this).addClass('disabled');
 		$(this).html("Saving...");


    //$('#new_order').submit();


		var isFormValid = true;
    $("#new_order .required input:text").each(function(){ // Note the :text
      if ($.trim($(this).val()).length == 0){
        isFormValid = false;
      }
    });
    if (!isFormValid) {
    	$('.alert').html("<a class='close' data-dismiss='alert'>×</a>Please type your name!");
    	$('.alert').show();
    	$('#btn-order').removeClass('disabled').html("Submit");
    } else {
    	$('#new_order').submit();
    }



  });

});

