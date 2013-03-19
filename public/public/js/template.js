
$.ajax({
  url: 'https://api.twitter.com/1/statuses/user_timeline.json?screen_name=envato&count=1&callback=?',
  dataType: 'json',
  success: function(data){
    $.each(data, function(i,item){
      ct = item.text;
      // include time tweeted - thanks to will
      mytime = item.created_at;
      var strtime = mytime.replace(/(\+\S+) (.*)/, '$2 $1')
      var mydate = new Date(Date.parse(strtime)).toLocaleDateString();
      var mytime = new Date(Date.parse(strtime)).toLocaleTimeString();
      ct = ct.replace(/http:\/\/\S+/g,  '<a href="$&" target="_blank">$&</a>');
      twitterURL = "http://twitter.com/";
      ct = ct.replace(/\s(@)(\w+)/g,    ' @<a href="'+twitterURL+'$2">$2</a>');
      ct = ct.replace(/\s(#)(\w+)/g,    ' #<a href="'+twitterURL+'search?q=%23$2" target="_blank">$2</a>');
      $("#jstweets").append('<div>'+ct + ' <small><i>(' + mydate + ' @ ' + mytime + ')</i></small></div>');
    });
  }
});


/*global $:false */
(function($){
    $.fn.parallax = function(options){
        var $$ = $(this);
        offset = $$.offset();
        var defaults = {
            "start": 0,
            "stop": offset.top + $$.height(),
            "coeff": 0.95
        };
        var opts = $.extend(defaults, options);
        return this.each(function(){
            $(window).bind('scroll', function() {
                windowTop = $(window).scrollTop();
                if((windowTop >= opts.start) && (windowTop <= opts.stop)) {
                    newCoord = windowTop * opts.coeff;
                    $$.css({
                        "background-position": "50%"+ newCoord + "px"
                    });
                }
            });
        });
    };
})(jQuery);

// call the plugin
//$('#team-top').parallax({ "coeff":-0.25 });
//$('#services-top').parallax({ "coeff":-0.14 });
//$('#works-top').parallax({ "coeff":-0.10 });
//$('#blog-top').parallax({ "coeff":-0.08 });
//$('#contact-top').parallax({ "coeff":-0.04 });


/*global $:false */
	  $(document).ready(function() {"use strict";
	    $( '.words' ).lettering('words');
	  });
	  
	  
/*global $:false */
	 // DOM ready
	 $(function() {"use strict";
	   
      // Create the dropdown base
      $("<select />").appendTo(".nav-container nav");
      
      // Create default option "Go to..."
      $("<option />", {
         "selected": "selected",
         "value"   : "",
         "text"    : "Go to..."
      }).appendTo(".nav-container nav select");
      
      // Populate dropdown with menu items
      $(".nav-container nav a").each(function() {
       var el = $(this);
       $("<option />", {
           "value"   : el.attr("href"),
           "text"    : el.text()
       }).appendTo(".nav-container nav select");
      });
      
	   // To make dropdown actually work
	   // To make more unobtrusive: http://css-tricks.com/4064-unobtrusive-page-changer/
      $("nav select").change(function() {
        window.location = $(this).find("option:selected").val();
      });
	 
	 });

	 
