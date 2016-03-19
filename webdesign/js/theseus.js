// Highlight the top nav as scrolling occurs
$(document).ready(function() {
    $('body').scrollspy({
        target: '.navbar-fixed-top'
    });

    var code;
    $('#submit').click(function() {
        code = ($('#book-code').val());
        smoothScroll.animateScroll('#map');

        // put an image

        return false;
    });

});
