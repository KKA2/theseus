// Highlight the top nav as scrolling occurs
$(document).ready(function() {
    $('body').scrollspy({
        target: '.navbar-fixed-top'
    });

    var code;
    $('#submit').click(function() {
        code = ($('#book-code').val());

        if (code == 'E 743.5 .H43 2011') {
            $("#book-floor").attr("src","img/floors/hesburgh10.jpg");
            $('#book-title').text('What\'s Fair On The Air?');
            $('#book-author').text('Heather Hendershot');
        }
        else if (code == 'E 208 .M85 2012') {
            $("#book-floor").attr("src","img/floors/hesburgh10.jpg");
            $('#book-title').text('The Birth of the Republic');
            $('#book-author').text('Edmund S. Morgan');
        }
        smoothScroll.animateScroll('#map');

        return false;
    });

});
