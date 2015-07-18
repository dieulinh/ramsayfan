$ ->
	$('#dishes-container').imagesLoaded ->
    $('#dishes-container').masonry
      itemSelector: '.box',
      columnWidth: 100