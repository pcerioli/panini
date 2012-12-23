
$(function(){

// basic show and hide

  $('div#remote_image_url').hide();

  $('#remote_link').click( function() { 
    $('a#remote_link').hide();
    $('div#remote_image_url').show();
  });

  
  var $container = $('#container');
  
  $container.imagesLoaded(function(){
    $container.masonry({
      itemSelector: '.box',
      //columnWidth: 100
    });

  });
  
  $container.infinitescroll({
    navSelector  : '#page-nav',    // selector for the paged navigation 
    nextSelector : '#page-nav a',  // selector for the NEXT link (to page 2)
    itemSelector : '.box',     // selector for all items you'll retrieve
    loading: {
        finishedMsg: 'No more pages to load.',
        img: '/assets/6RMhx.gif'
      }
    },
    // trigger Masonry as a callback
    function( newElements ) {
      // hide new items while they are loading
      var $newElems = $( newElements ).css({ opacity: 0 });
      // ensure that images load before adding to masonry layout
      $newElems.imagesLoaded(function(){
        // show elems now they're ready
        $newElems.animate({ opacity: 1 });
        $container.masonry( 'appended', $newElems, true ); 
      });
    }
  );


  // $("#avatars_search input").keyup(function() {
  //   $.get($("#avatars_search").attr("action"), $("#avatars_search").serialize(), null, "script");
  //   return false;
  // });

  $(".pin-image").on("click", function(event){
    $(this).parents(".box").addClass("back");
  });

   $('.box').live('mouseenter', function() {
      $(this).find(".pin-order").show();
  }).live('mouseleave', function() {
      $(this).find(".pin-order").hide();
  });   

});