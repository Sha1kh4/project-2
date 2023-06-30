$(function () {

    // Initate masonry grid
    var $grid = $('.gallery-wrapper').masonry({
        temSelector: '.grid-item',
        columnWidth: '.grid-sizer',
        percentPosition: true,
    });

    // Initate imagesLoaded
    $grid.imagesLoaded().progress( function() {
        $grid.masonry('layout');
    });
    
});