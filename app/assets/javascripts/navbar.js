(function($){
    $(document).ready(function(){
        var offset = $(".navbar-wagon-fixed").offset().top;
        $(document).scroll(function(){
            var scrollTop = $(document).scrollTop();
            if(scrollTop > offset){
                $(".navbar-wagon-fixed").css("position", "fixed");
            }
            else {
                $(".navbar-wagon-fixed").css("position", "static");
            }
        });
    });
})(jQuery);
