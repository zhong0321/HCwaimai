define(['lib/jquery', 'lib/jquery/easing'], function($, easing) {
    var Jsidebar = $('#J-sidebar');
    var Jgotop = $('#J-gotop');
    var Jarrow = $('#J-gotop i');
    var Jtext = $('#J-gotop p');


    Jsidebar.hover(function() {
        $(this).animate({ right: '0px' }, 100);
    }, function() {
        $(this).animate({ right: '-64px' }, 100);
    });

    Jgotop.click(function() {
        var scrollTop = $(window).scrollTop();
        if (scrollTop > 0) {
            $('body,html').animate({ scrollTop: 0 }, 500, 'easeInOutCubic');
        } else {
            return;
        }
    });
});
