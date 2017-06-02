(function($){
    $(document).ready(function(){
        var offset = $(".navbar-wagon").offset().top;
        $(document).scroll(function(){
            var scrollTop = $(document).scrollTop();
            if(scrollTop > offset){
                $(".navbar-wagon").css("position", "fixed");
            }
            else {
                $(".navbar-wagon").css("position", "static");
            }
        });
    });
})(jQuery);
